import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_web_fun/src/app.dart';
import 'package:test_web_fun/src/screens/login.dart';

import 'src/screens/adminScreens/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
