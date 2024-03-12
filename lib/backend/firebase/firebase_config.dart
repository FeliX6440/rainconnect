import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBA7_qMu1Ns35_R62NgW4LXhB9-3Uvg9vY",
            authDomain: "rainconnect-b85obh.firebaseapp.com",
            projectId: "rainconnect-b85obh",
            storageBucket: "rainconnect-b85obh.appspot.com",
            messagingSenderId: "372239090571",
            appId: "1:372239090571:web:0c8720b58e232442faa58e"));
  } else {
    await Firebase.initializeApp();
  }
}
