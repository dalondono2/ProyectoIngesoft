import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_web_fun/src/models/evaluation_model.dart';
import 'package:test_web_fun/src/screens/teacherScreens/evaluation_teacher.dart';

class AddEvaluationTeacher extends StatefulWidget {
  const AddEvaluationTeacher({Key? key}) : super(key: key);

  @override
  State<AddEvaluationTeacher> createState() => _AddEvaluationTeacherState();
}

class _AddEvaluationTeacherState extends State<AddEvaluationTeacher> {
  late String nameValue;
  late String numQuestionsValue;
  late String careerValue;
  late String matterValue;
  late String activeValue;

  //permite acceder al arbol de widgets en cualquier lugar
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //Focos
  late FocusNode nameFocus;
  late FocusNode numQuestionsFocus;
  late FocusNode careerFocus;
  late FocusNode matterFocus;
  late FocusNode activeFocus;

  //controladores
  late TextEditingController nameController;
  late TextEditingController numQuestionsController;
  late TextEditingController careerController;
  late TextEditingController matterController;
  late TextEditingController activeController;

  //Firebase
  final firabaseInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agregar Evaluación")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nombre :"),
                onSaved: (value) {
                  nameValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: nameFocus,
                onEditingComplete: () {
                  requestFocus(context, numQuestionsFocus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: numQuestionsController,
                keyboardType: TextInputType.number,

                decoration: const InputDecoration(labelText: "N° preguntas :"),
                onSaved: (value) {
                  numQuestionsValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: numQuestionsFocus,
                onEditingComplete: () {
                  requestFocus(context, careerFocus);
                },
                textInputAction: TextInputAction.next,
                //controller: lastNameTextController,
              ),
              TextFormField(
                controller: careerController,
                decoration: const InputDecoration(labelText: "Carrera  :"),
                onSaved: (value) {
                  careerValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: careerFocus,
                onEditingComplete: () {
                  requestFocus(context, matterFocus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: matterController,
                decoration: const InputDecoration(labelText: "Materia  :"),
                onSaved: (value) {
                  careerValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: matterFocus,
                onEditingComplete: () {
                  requestFocus(context, activeFocus);
                },
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: activeController,
                decoration:
                    const InputDecoration(labelText: "activado/desactivado :"),
                onSaved: (value) {
                  activeValue = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "llene este campo";
                  }
                },
                focusNode: activeFocus,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: (() {
                    _saveDataBase(context);
                  }),
                  child: const Text("Agregar Evaluación")),
            ],
          ),
        ),
      ),
    );
  }

  void _saveDataBase(BuildContext context) {
    var query = firabaseInstance.collection("evaluation");
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      //acá debería poner el código para agregar a la base de datos
      var q = EvaluationModel(
        name: nameController.text,
        numquestion: numQuestionsController.text,
        career: careerController.text,
        matter: matterController.text,
        active: activeController.text,
      );

      query.add(q.toJson()).whenComplete(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const EvaluationTeacher()));
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
    nameFocus = FocusNode();
    numQuestionsFocus = FocusNode();
    careerFocus = FocusNode();
    activeFocus = FocusNode();
    matterFocus = FocusNode();

    nameController = TextEditingController();
    numQuestionsController = TextEditingController();
    careerController = TextEditingController();
    activeController = TextEditingController();
    matterController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameFocus.dispose();
    numQuestionsFocus.dispose();
    careerFocus.dispose();
    activeFocus.dispose();
    matterFocus.dispose();

    nameController.dispose();
    numQuestionsController.dispose();
    careerController.dispose();
    matterController.dispose();
    activeController.dispose();
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
