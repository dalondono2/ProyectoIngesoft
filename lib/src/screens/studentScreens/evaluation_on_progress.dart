import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_web_fun/src/models/questions_model.dart';

class EvaluationProgress extends StatefulWidget {
  const EvaluationProgress({Key? key}) : super(key: key);

  @override
  State<EvaluationProgress> createState() => _EvaluationProgressState();
}

class _EvaluationProgressState extends State<EvaluationProgress> {
  final List<QuestionModel> listOfQuestions = createEvaluation(3);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'evaluation',
        home: Scaffold(
            appBar: AppBar(
              title: const Text("nombre de la evaluacion"),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) => buildCard(context, index),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Enviar Evaluación"),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget buildCard(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.green,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    listOfQuestions[index].contexto,
                  ),
                  Text("ACA VOY A TRAER EL CONTEXTO DE LA BASE DE DATOS")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blueAccent,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    listOfQuestions[index].statement,
                  ),
                  Text("ACA VOY A TRAER EL ENUNCIADO DE LA BASE DE DATOS")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.greenAccent.withOpacity(0.4),
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    "OPCIONES DE RESPUESTA",
                  ),
                  const Text(
                      "ACA VOY A TRAER LAS OPCIONES DE LA BASE DE DATOS"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
                      Text(listOfQuestions[index].answer1)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
                      Text(listOfQuestions[index].answer2)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
                      Text(listOfQuestions[index].answer3)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
                      Text(listOfQuestions[index].answer4)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<QuestionModel> createEvaluation(int numberQuestions) {
  final Stream<QuerySnapshot> _questions =
      FirebaseFirestore.instance.collection('question').snapshots();

  List<QuestionModel> _listQuestions =
      _questions.toList() as List<QuestionModel>;

  List<QuestionModel> _listQuestionsReturn = [];

  for (int i = 0; i <= numberQuestions; i++) {
    int indexRamdom = Random().nextInt(_listQuestions.length - 1);
    _listQuestionsReturn[i] = _listQuestions[indexRamdom];
    print(_listQuestionsReturn[i].toString());
  }
  return _listQuestionsReturn;
}
