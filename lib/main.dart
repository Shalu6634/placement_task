import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Daily_task_day2/view/login_page.dart';
import 'firebase_options.dart';

Future<void> main()
async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),);
  }
}