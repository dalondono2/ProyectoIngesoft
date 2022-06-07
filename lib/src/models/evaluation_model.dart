// To parse this JSON data, do
//
//     final evaluationModel = evaluationModelFromJson(jsonString);

import 'dart:convert';

EvaluationModel evaluationModelFromJson(String str) =>
    EvaluationModel.fromJson(json.decode(str));

String evaluationModelToJson(EvaluationModel data) =>
    json.encode(data.toJson());

class EvaluationModel {
  EvaluationModel({
    required this.name,
    required this.numquestion,
    required this.career,
    required this.matter,
    required this.active,
  });

  String name;
  String numquestion;
  String career;
  String matter;
  String active;

  factory EvaluationModel.fromJson(Map<String, dynamic> json) =>
      EvaluationModel(
        name: json["name"],
        numquestion: json["numquestion"],
        career: json["career"],
        matter: json["matter"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "numquestion": numquestion,
        "career": career,
        "matter": matter,
        "active": active,
      };
}
