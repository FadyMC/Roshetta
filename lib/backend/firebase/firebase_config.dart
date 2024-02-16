import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDuOboeZBcL4jUByOmQD-PvmesYRTKtnUA",
            authDomain: "roshetta-6e3ny2.firebaseapp.com",
            projectId: "roshetta-6e3ny2",
            storageBucket: "roshetta-6e3ny2.appspot.com",
            messagingSenderId: "598636726190",
            appId: "1:598636726190:web:2ccf6bfdfc67d19d792a3f"));
  } else {
    await Firebase.initializeApp();
  }
}
