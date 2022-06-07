import 'package:flutter/material.dart';
import 'package:test_web_fun/src/screens/adminScreens/register.dart';
import 'package:test_web_fun/src/screens/login.dart';
import 'package:test_web_fun/src/screens/studentScreens/evaluation_on_progress.dart';

import 'screens/adminScreens/register2.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      initialRoute: "/register2",
      routes: {
        "/login": (BuildContext context) => const LoginPage(),
        "/register": (BuildContext context) => const Register(),
        "/register2": (BuildContext context) => Register2(),
        "/evalutionProgress": (BuildContext context) =>
            const EvaluationProgress(),
      },
    );
  }
}
