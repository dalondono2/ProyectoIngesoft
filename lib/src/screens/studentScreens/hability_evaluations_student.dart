import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_web_fun/src/screens/studentScreens/evaluation_on_progress.dart';

import 'evaluation_in_progress3.dart';

class HabilityEvaluationsStudent extends StatefulWidget {
  const HabilityEvaluationsStudent({Key? key}) : super(key: key);

  @override
  _HabilityEvaluationsStudentState createState() =>
      _HabilityEvaluationsStudentState();
}

class _HabilityEvaluationsStudentState
    extends State<HabilityEvaluationsStudent> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('evaluation')
      .where('active', isEqualTo: 'activado')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluaciones Habilitadas'),
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: ListTile(
                          onLongPress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EvaluationInProgress(),
                              ),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['name'],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          trailing: Text(
                            snapshot.data!.docChanges[index].doc['matter'],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void showEvaluation(BuildContext context, String name) {
    Navigator.pushNamed(context, '/evaluationProgress',
        arguments: {'name': name});
  }

  void showEvaluation2(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EvaluationProgress(),
      ),
    );
  }
}
