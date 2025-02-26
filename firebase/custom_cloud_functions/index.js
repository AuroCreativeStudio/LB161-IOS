const admin = require("firebase-admin/app");
admin.initializeApp();

const notifyBirthdayAnniversary = require("./notify_birthday_anniversary.js");
exports.notifyBirthdayAnniversary =
  notifyBirthdayAnniversary.notifyBirthdayAnniversary;
