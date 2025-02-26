import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAt51sB0qcm3d0EjNikkqZgV9-7QBEbm0c",
            authDomain: "lodge-bharathi.firebaseapp.com",
            projectId: "lodge-bharathi",
            storageBucket: "lodge-bharathi.appspot.com",
            messagingSenderId: "713695826403",
            appId: "1:713695826403:web:b497e206ebe2a9bb3650d6",
            measurementId: "G-B66RVZHF8F"));
  } else {
    await Firebase.initializeApp();
  }
}
