// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    required this.name,
    required this.password,
    required this.username,
    required this.career,
  });

  String name;
  String password;
  String username;
  String career;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json["name"],
        password: json["password"],
        username: json["username"],
        career: json["career"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "username": username,
        "career": career,
      };
}
