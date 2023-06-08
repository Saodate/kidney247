import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCj4Qn4zpV-XxYf1jxy99UOsUdR1cnOVG0",
            authDomain: "kidneyhealth-ecf1f.firebaseapp.com",
            projectId: "kidneyhealth-ecf1f",
            storageBucket: "kidneyhealth-ecf1f.appspot.com",
            messagingSenderId: "996279470444",
            appId: "1:996279470444:web:f7bb0980ac7d5ab1b68b49",
            measurementId: "G-JDQP5FBP2L"));
  } else {
    await Firebase.initializeApp();
  }
}
