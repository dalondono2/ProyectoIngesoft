import 'package:flutter/material.dart';
import 'package:test_web_fun/src/screens/studentScreens/hability_evaluations_student.dart';

class DrawerStudent extends StatelessWidget {
  const DrawerStudent({Key? key}) : super(key: key);

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
          title: const Text("Exámenes Habilitados"),
          leading: const Icon(Icons.home),
          onTap: () => showHabilityEvaluations(context),
        ),
        ListTile(
          title: const Text("Ver Mis Exámenes"),
          leading: const Icon(Icons.home),
          onTap: () => showHome(context),
        ),
      ]),
    );
  }

  void showHome(BuildContext context) {
    Navigator.pop(context);
  }

  void showHabilityEvaluations(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HabilityEvaluationsStudent(),
      ),
    );
  }
}
