import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCwGWZguD7lbZcCTGrBtCA8zlW0Te-6Kno",
            authDomain: "my-swim-stats-v2-vh6xu2.firebaseapp.com",
            projectId: "my-swim-stats-v2-vh6xu2",
            storageBucket: "my-swim-stats-v2-vh6xu2.appspot.com",
            messagingSenderId: "968701667337",
            appId: "1:968701667337:web:f4f8758af593ad01f230d8"));
  } else {
    await Firebase.initializeApp();
  }
}
