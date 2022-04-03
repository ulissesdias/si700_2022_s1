import 'package:b_simple_widgets_in_tab_bar/view/second_screen.dart';
import 'package:b_simple_widgets_in_tab_bar/view/third_screen.dart';
import 'package:flutter/material.dart';
import 'view/first_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.red,
      ),
      home: DefaultTabController(
          child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ]),
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: const Text("widget.title"),
              ),
              body: TabBarView(children: [
                const MyFirstScreen(
                    title: 'Flutter Demo Clicker Counter Home Page'),
                MySecondScreen(),
                MyThirdScreen()
              ])),
          length: 3),
    );
  }
}
