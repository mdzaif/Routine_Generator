import 'package:flutter/material.dart';
import 'login.dart';

// firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // MyApp
  runApp(const MyApp());
}
