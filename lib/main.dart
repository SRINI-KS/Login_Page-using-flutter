// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'constant.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//kNZUoSZf8WM3EYDoAC8k6CoJkDz2

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginscreen(),
      title: appname,
    );
  }
}
