import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class EvaluationInProgress extends StatefulWidget {
  const EvaluationInProgress({Key? key}) : super(key: key);

  @override
  State<EvaluationInProgress> createState() => _EvaluationInProgressState();
}

class _EvaluationInProgressState extends State<EvaluationInProgress> {
  //Firebase
  final firebaseInstance = FirebaseFirestore.instance.collection("question");

  List<String> docsIDs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Evaluación en Progreso"),
      ),
      body: FutureBuilder(
        future: getDoc(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: docsIDs.length,
              itemBuilder: ((context, index) {
                return Center(
                  child: ListTile(
                    title: GetQuestions(documentId: docsIDs[index]),
                  ),
                );
              }));
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //me retorna la referencia de la base de datos
  Future getDoc() async {
    await firebaseInstance
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docsIDs.add(document.reference.id);
            }));
  }
}

class GetQuestions extends StatelessWidget {
  String documentId;
  GetQuestions({required this.documentId});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference questions =
        FirebaseFirestore.instance.collection('question');

    return FutureBuilder<DocumentSnapshot>(
      future: questions.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return buildCard(
              context,
              data['contexto'].toString(),
              data['statement'].toString(),
              data['answer1'].toString(),
              data['answer2'].toString(),
              data['answer3'].toString(),
              data['answer4'].toString(),
              data['answercorrect'].toString(),
              data['justification'].toString(),
              data['matter'].toString());
        }
        return const Text('Loading');
      }),
    );
  }
}

Widget buildCard(
    BuildContext context,
    String contexto,
    String statement,
    String answer1,
    String answer2,
    String answer3,
    String answer4,
    String answercorrect,
    String justification,
    String matter) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Card(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.green.withOpacity(0.4),
            width: double.infinity,
            child: Column(
              children: [
                const Text(
                  "Contexto",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  contexto,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blueAccent.withOpacity(0.4),
            width: double.infinity,
            child: Column(
              children: [
                const Text(
                  "Enunciado",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  statement,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.greenAccent.withOpacity(0.4),
            width: double.infinity,
            child: Column(
              children: [
                const Text(
                  "Opciones de respuesta",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(value: null, groupValue: null, onChanged: null),
                    Text(answer1)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(value: null, groupValue: null, onChanged: null),
                    Text(answer2)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(value: null, groupValue: null, onChanged: null),
                    Text(answer3)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(value: null, groupValue: null, onChanged: null),
                    Text(answer4)
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
