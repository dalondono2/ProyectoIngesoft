// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  Teacher({
    required this.name,
    required this.password,
    required this.username,
  });

  String name;
  String password;
  String username;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        name: json["name"],
        password: json["password"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "username": username,
      };
}
