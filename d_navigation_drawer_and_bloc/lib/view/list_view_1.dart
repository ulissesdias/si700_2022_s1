import 'package:flutter/material.dart';

class ListView1 extends StatelessWidget {
  ListView1({Key? key}) : super(key: key);

  final List colors = [
    Colors.green,
    Colors.grey,
    Colors.blue,
    Colors.red,
    Colors.black
  ];

  final List icons = [
    Icons.cake,
    Icons.calendar_view_day,
    Icons.accessible_forward,
    Icons.account_box
  ];

  final List texto = [
    "Ulisses",
    "Guilherme",
    "Meira",
    "André",
    "Ana",
    "Gisele",
    "Lubi",
    "Ieda",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          color: Colors.blue,
          elevation: 5,
          child: ListTile(
            title: const Text('Ulisses Martins Dias'),
            subtitle: const Text("Professor de SI700"),
            leading: const Icon(Icons.access_time),
            trailing: const Icon(Icons.add_a_photo),
            onTap: () {},
          ),
        ),
        const Material(
          child: ListTile(
            title: Text('Guilherme Coelho'),
            subtitle: Text('Professor de SI100'),
            enabled: false,
          ),
        ),
        ListTile(
            title: const Text('Luís Meira'),
            trailing: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () {},
            )),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.red, Colors.yellow, Colors.green]),
          ),
          child: const ListTile(
            title: Text('Outro Professor Qualquer'),
          ),
        ),
      ],
    );
  }
}
