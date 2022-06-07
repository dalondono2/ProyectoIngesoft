import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardQuestionEvaluation extends StatefulWidget {
  @override
  State<CardQuestionEvaluation> createState() => _CardQuestionEvaluationState();
}

class _CardQuestionEvaluationState extends State<CardQuestionEvaluation> {
  @override
  Widget build(
    BuildContext context,
  ) {
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
                children: const [
                  Text(
                    "contexto",
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
                children: const [
                  Text(
                    "Enunciado",
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
                      Text("respuesta 1")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
                      Text("respuesta 2")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
                      Text("respuesta 3")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
                      Text("respuesta 4")
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
