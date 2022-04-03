import 'package:flutter/material.dart';

class MySecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            contrainedFitted(),
            const Divider(
              thickness: 3,
            ),
            containerComFirula(),
            const Divider(
              thickness: 3,
            ),
            cardLayout()
          ],
        ),
      ),
    );
  }
}

Widget contrainedFitted() {
  return ConstrainedBox(
    constraints: const BoxConstraints(
      minWidth: 60,
      minHeight: 60,
    ),
    child: const FittedBox(
      fit: BoxFit.fill,
      child: Text("Ulisses"),
    ),
  );
}

Widget containerComFirula() {
  return Container(
    //width: 200,
    //height: 200,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(40),
      boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 20)],
      gradient: const LinearGradient(
          colors: [Colors.blue, Colors.red, Colors.yellow, Colors.green]),
    ),
    child: const SizedBox(
      width: double.infinity,
      height: 100,
      child: Text(
        "Romeo",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    padding: const EdgeInsets.all(40),
    margin: const EdgeInsets.all(40),
  );
}

Widget cardLayout() {
  return Card(
      child: Column(
        children: const [
          Text("Filho Interno"),
          RotatedBox(quarterTurns: 3, child: Text("Romeo Dias"))
        ],
      ),
      color: Colors.blueAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
}
