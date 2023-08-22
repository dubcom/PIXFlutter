import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCWO7BxJzE9SLQ1tJQSEQVtcyshF3sN1z0",
            authDomain: "gerapix-7ff43.firebaseapp.com",
            projectId: "gerapix-7ff43",
            storageBucket: "gerapix-7ff43.appspot.com",
            messagingSenderId: "84025690935",
            appId: "1:84025690935:web:fecddb55181e3cac2628b2",
            measurementId: "G-KRE17JS9L2"));
  } else {
    await Firebase.initializeApp();
  }
}
