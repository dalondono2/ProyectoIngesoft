import 'package:flutter/material.dart';
import 'package:test_web_fun/src/screens/teacherScreens/StudentList.dart';
import 'package:test_web_fun/src/screens/teacherScreens/add_question_teacher.dart';
import 'package:test_web_fun/src/screens/teacherScreens/evaluation_teacher.dart';
import 'package:test_web_fun/src/screens/teacherScreens/question_teacher.dart';

class DrawerTeacher extends StatelessWidget {
  const DrawerTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Cosmo Nauta"),
          accountEmail: Text("cosmonauta@poligran.edu.co"),
          currentAccountPicture: FlutterLogo(),
          otherAccountsPictures: [FlutterLogo()],
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 19, 149, 209),
            Color.fromARGB(255, 11, 70, 116)
          ], end: Alignment.bottomRight)),
        ),
        /*DrawerHeader(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FlutterLogo(
                size: 100,
              ),
              Text(
                "I <3  Poli",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),*/
        ListTile(
            title: const Text("Banco de Preguntas"),
            leading: const Icon(Icons.comment_bank),
            onTap: () => showBankQuestions(context)),
        ListTile(
          title: const Text("Agregar Preguntas"),
          leading: const Icon(Icons.add_chart),
          onTap: () => showAddQuestion(context),
        ),
        ListTile(
          title: const Text(" Evaluaciones "),
          leading: const Icon(Icons.home),
          onTap: () => showEvaluation(context),
        ),
        ListTile(
          title: const Text("Ver Exámenes Habilitados"),
          leading: const Icon(Icons.home),
          onTap: () => generalRouter(context, const QuestionTeacher()),
        ),
        ListTile(
          title: const Text("Ver lista estudiantes"),
          leading: const Icon(Icons.home),
          onTap: () => showStudientList(context),
        ),
      ]),
    );
  }

  void showHome(BuildContext context) {
    Navigator.pop(context);
  }

  void showBankQuestions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const QuestionTeacher(),
      ),
    );
  }

  void showAddQuestion(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddQuestionTeacher(),
      ),
    );
  }

  void showStudientList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StudientList(),
      ),
    );
  }

  void generalRouter(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void showEvaluation(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EvaluationTeacher(),
      ),
    );
  }
}
