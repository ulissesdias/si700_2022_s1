import 'package:c_bottom_navigation_bar_with_forms/view/first_screen.dart';
import 'package:c_bottom_navigation_bar_with_forms/view/second_screen.dart';
import 'package:c_bottom_navigation_bar_with_forms/view/third_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: [
          FirstScreen(),
          const SecondScreen(),
          const ThirdScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Primeira"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms_rounded), label: "Segunda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Terceira"),
        ],
        currentIndex: _currentScreen,
        onTap: (int novoItem) {
          setState(() {
            _currentScreen = novoItem;
          });
        },
        fixedColor: Colors.red,
      ),
    );
  }
}
