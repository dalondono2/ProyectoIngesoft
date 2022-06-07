import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_web_fun/src/screens/teacherScreens/question_teacher.dart';

import '../../models/questions_model.dart';

class AddQuestionTeacher extends StatefulWidget {
  const AddQuestionTeacher({Key? key}) : super(key: key);

  @override
  State<AddQuestionTeacher> createState() => _AddQuestionTeacherState();
}

class _AddQuestionTeacherState extends State<AddQuestionTeacher> {
  late String contextoValue;
  late String statementValue;
  late String answer1Value;
  late String answer2Value;
  late String answer3Value;
  late String answer4Value;
  late String answerCorrectValue;
  late String justificationValue;
  late String matterValue;

  //permite acceder al arbol de widgets en cualquier lugar
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //Focos
  late FocusNode contextoFocus;
  late FocusNode statementFocus;
  late FocusNode answer1Focus;
  late FocusNode answer2Focus;
  late FocusNode answer3Focus;
  late FocusNode answer4Focus;
  late FocusNode answerCorrectFocus;
  late FocusNode justificationFocus;
  late FocusNode matterFocus;

  //controladores
  late TextEditingController contextoController;
  late TextEditingController statementController;
  late TextEditingController answer1Controller;
  late TextEditingController answer2Controller;
  late TextEditingController answer3Controller;
  late TextEditingController answer4Controller;
  late TextEditingController answerCorrectController;
  late TextEditingController justificationController;
  late TextEditingController matterController;

  //Firebase
  final firabaseInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agregar Pregunta")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextFormField(
                controller: contextoController,
                decoration: const InputDecoration(labelText: "Contexto :"),
                onSaved: (value) {
                  contextoValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: contextoFocus,
                onEditingComplete: () {
                  requestFocus(context, statementFocus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: statementController,
                decoration: const InputDecoration(labelText: "Enunciado :"),
                onSaved: (value) {
                  statementValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: statementFocus,
                onEditingComplete: () {
                  requestFocus(context, answer1Focus);
                },
                textInputAction: TextInputAction.next,
                //controller: lastNameTextController,
              ),
              TextFormField(
                controller: answer1Controller,
                decoration: const InputDecoration(labelText: "Respuesta 1 :"),
                onSaved: (value) {
                  answer1Value = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: answer1Focus,
                onEditingComplete: () {
                  requestFocus(context, answer2Focus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: answer2Controller,
                decoration: InputDecoration(labelText: "Respuesta 2 :"),
                onSaved: (value) {
                  answer2Value = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: this.answer2Focus,
                onEditingComplete: () {
                  requestFocus(context, answer3Focus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: answer3Controller,
                decoration: InputDecoration(labelText: "Respuesta 3 :"),
                onSaved: (value) {
                  answer3Value = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: this.answer3Focus,
                onEditingComplete: () {
                  requestFocus(context, answer4Focus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: answer4Controller,
                decoration: InputDecoration(labelText: "Respuesta 4 :"),
                onSaved: (value) {
                  answer4Value = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: this.answer4Focus,
                onEditingComplete: () {
                  requestFocus(context, answerCorrectFocus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: answerCorrectController,
                decoration: InputDecoration(labelText: "Respuesta Correcta :"),
                onSaved: (value) {
                  answerCorrectValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: this.answerCorrectFocus,
                onEditingComplete: () {
                  requestFocus(context, justificationFocus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: justificationController,
                decoration: InputDecoration(labelText: "Justificación :"),
                onSaved: (value) {
                  justificationValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: this.justificationFocus,
                onEditingComplete: () {
                  requestFocus(context, matterFocus);
                },
              ),
              TextFormField(
                controller: matterController,
                decoration: InputDecoration(labelText: "Materia :"),
                onSaved: (value) {
                  matterValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: matterFocus,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: (() {
                    _saveDataBase(context);
                  }),
                  child: const Text("Agregar pregunta al banco")),
            ],
          ),
        ),
      ),
    );
  }

  void _saveDataBase(BuildContext context) {
    var query = firabaseInstance.collection("question");
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      //acá debería poner el código para agregar a la base de datos
      var q = QuestionModel(
          contexto: contextoController.text,
          statement: statementController.text,
          answer1: answer1Controller.text,
          answer2: answer2Controller.text,
          answer3: answer3Controller.text,
          answer4: answer4Controller.text,
          answercorrect: answerCorrectController.text,
          justification: justificationController.text,
          matter: matterController.text);

      query.add(q.toJson()).whenComplete(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const QuestionTeacher()));
      }); //agregar
      //query.where("materia":"quimica").get().then((value) => print(value.toString()));
      // query.get().then((value) => print(object));
      // query.

      //preguntarle a shusho, co)
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contextoFocus = FocusNode();
    statementFocus = FocusNode();
    answer1Focus = FocusNode();
    answer2Focus = FocusNode();
    answer3Focus = FocusNode();
    answer4Focus = FocusNode();
    answerCorrectFocus = FocusNode();
    justificationFocus = FocusNode();
    matterFocus = FocusNode();

    contextoController = TextEditingController();
    statementController = TextEditingController();
    answer1Controller = TextEditingController();
    answer2Controller = TextEditingController();
    answer3Controller = TextEditingController();
    answer4Controller = TextEditingController();
    answerCorrectController = TextEditingController();
    justificationController = TextEditingController();
    matterController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    contextoFocus.dispose();
    statementFocus.dispose();
    answer1Focus.dispose();
    answer2Focus.dispose();
    answer3Focus.dispose();
    answer4Focus.dispose();
    answerCorrectFocus.dispose();
    justificationFocus.dispose();
    matterFocus.dispose();
    contextoController.dispose();
    statementController.dispose();
    answer1Controller.dispose();
    answer2Controller.dispose();
    answer3Controller.dispose();
    answer4Controller.dispose();
    answerCorrectController.dispose();
    justificationController.dispose();
    matterController.dispose();
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
