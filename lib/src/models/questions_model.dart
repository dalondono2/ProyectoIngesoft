// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

QuestionModel questionFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    required this.contexto,
    required this.statement,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.answercorrect,
    required this.justification,
    required this.matter,
  });

  String contexto;
  String statement;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String answercorrect;
  String justification;
  String matter;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        contexto: json["contexto"],
        statement: json["statement"],
        answer1: json["answer1"],
        answer2: json["answer2"],
        answer3: json["answer3"],
        answer4: json["answer4"],
        answercorrect: json["answercorrect"],
        justification: json["justification"],
        matter: json["matter"],
      );

  Map<String, dynamic> toJson() => {
        "contexto": contexto,
        "statement": statement,
        "answer1": answer1,
        "answer2": answer2,
        "answer3": answer3,
        "answer4": answer4,
        "answercorrect": answercorrect,
        "justification": justification,
        "matter": matter,
      };
}
