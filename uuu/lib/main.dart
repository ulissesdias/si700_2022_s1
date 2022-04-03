import 'package:flutter/material.dart';
import 'package:exemplo/view/first_screen.dart';

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
                title: Text("widget.title"),
              ),
              body: TabBarView(children: [
                MyHomePage(title: 'Flutter Demo Clicker Counter Home Page'),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ])),
          length: 3),
    );
  }
}
