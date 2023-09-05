import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDLc3lGxJeAazAuB6CqHT1rGZd7rLbcmcs",
            authDomain: "hackeandoabetpro.firebaseapp.com",
            projectId: "hackeandoabetpro",
            storageBucket: "hackeandoabetpro.appspot.com",
            messagingSenderId: "631331521044",
            appId: "1:631331521044:web:e6532ac2a61e51f08a1d01",
            measurementId: "G-6GWDXR32ED"));
  } else {
    await Firebase.initializeApp();
  }
}
