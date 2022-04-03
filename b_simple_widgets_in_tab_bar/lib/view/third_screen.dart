import 'package:flutter/material.dart';

class MyThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*Center(
      child: Container(
        color: Colors.red,
      ),
    );*/
        presentationScreen();
  }
}

Widget presentationScreen() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              border: Border.all(color: Colors.black, width: 6)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(49),
              child: Image.asset(
                'assets/images/ulisses.gif',
                width: 200,
              )),
        ),
        const Text("Ulisses Martins Dias",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.blueAccent)),
        const Text(
          "Eu sou o professor de Programação para Dispositivos Móveis do ano de 2022 da Faculdade de Tecnologia da Unicamp. A PAD desta turma é a Carolina da Silva Sancho e o PED é o Pedro Bernini",
          style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              letterSpacing: 2,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
