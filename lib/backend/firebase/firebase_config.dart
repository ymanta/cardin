import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA73bc4hRA4Vcj_ip2nihzOQMYIdEJkof0",
            authDomain: "cardin-tarjeta-digital-117d5.firebaseapp.com",
            projectId: "cardin-tarjeta-digital-117d5",
            storageBucket: "cardin-tarjeta-digital-117d5.firebasestorage.app",
            messagingSenderId: "176357278277",
            appId: "1:176357278277:web:7356dc7b448293862a192c"));
  } else {
    await Firebase.initializeApp();
  }
}
