import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCD7valhGeAqpijAjNTgji5BEuw7B2UUbY",
            authDomain: "que-lo-que-2-05vr7v.firebaseapp.com",
            projectId: "que-lo-que-2-05vr7v",
            storageBucket: "que-lo-que-2-05vr7v.firebasestorage.app",
            messagingSenderId: "321496637481",
            appId: "1:321496637481:web:be01e4c02e5a73754f3c38"));
  } else {
    await Firebase.initializeApp();
  }
}
