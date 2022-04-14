import 'package:flutter/material.dart';

class ListView2 extends StatelessWidget {
  ListView2({Key? key}) : super(key: key);

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
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
          enabled: true,
          onTap: () {},
          title: Text(texto[index % texto.length],
              style: TextStyle(color: colors[index % colors.length])),
          leading: Icon(icons[index % icons.length]));
    });
  }
}
