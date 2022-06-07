import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';
import 'studentScreens/student.dart';
import 'teacherScreens/teacher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    return control();
  }
}

class control extends StatefulWidget {
  control();

  @override
  _controlState createState() => _controlState();
}

class _controlState extends State<control> {
  _controlState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rol;
  var emaill;
  // ignore: prefer_typing_uninitialized_variables
  var id;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rol = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
      });
    });
    super.initState();
  }

  routing() {
    Widget page;

    if (rol == 'Student') {
      page = Student(id: id);
    } else {
      page = Teacher(id: id);
    }
    return page;
  }

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    return routing();
  }
}
