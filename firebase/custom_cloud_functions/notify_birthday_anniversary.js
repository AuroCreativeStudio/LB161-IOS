const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.notifyBirthdayAnniversary = functions.pubsub
  .schedule("10 6 * * *") // 11:20 AM IST
  .timeZone("Asia/Kolkata")
  .onRun(async (context) => {
    const db = admin.firestore();
    const now = new Date();

    // Get today's date in DD/MM format
    const todayDate = now.toLocaleDateString("en-GB", {
      day: "2-digit",
      month: "2-digit",
    });

    try {
      // Fetch all users
      const usersSnapshot = await db.collection("users").get();
      const users = [];

      for (const userDoc of usersSnapshot.docs) {
        const userData = userDoc.data();

        // Extract only the MM/DD part for comparison
        const dob = userData.date_of_birth
          ? userData.date_of_birth.slice(0, 5)
          : null;
        const anniversary = userData.wedding_anniversary
          ? userData.wedding_anniversary.slice(0, 5)
          : null;
        const spouseDob = userData.spouse_dob
          ? userData.spouse_dob.slice(0, 5)
          : null;

        // If today's date matches any special occasion, store the user
        if ([dob, anniversary, spouseDob].includes(todayDate)) {
          users.push({
            id: userDoc.id,
            ref: userDoc.ref,
            fcmToken: userData.fcm_token, // Ensure FCM token exists
            occasion:
              dob === todayDate
                ? "Birthday"
                : anniversary === todayDate
                  ? "Anniversary"
                  : "Spouse Birthday",
          });
        }
      }

      if (users.length === 0) {
        console.log("No birthday/anniversary notifications today.");
        return;
      }

      // Send notifications to users
      const notifications = users.map((user) => {
        const message = {
          notification: {
            title: `🎉 Happy ${user.occasion}!`,
            body: `Wishing you a fantastic day filled with joy and happiness!`,
          },
          token: user.fcmToken,
        };
        return admin.messaging().send(message);
      });

      await Promise.all(notifications);

      console.log(`Sent notifications to ${users.length} users.`);
      return null;
    } catch (error) {
      console.error("Error sending notifications:", error);
      throw new functions.https.HttpsError("internal", "Notification failed.");
    }
  });
