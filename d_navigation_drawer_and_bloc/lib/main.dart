import 'package:d_navigation_drawer_and_bloc/view/bloc_1.dart';
import 'package:d_navigation_drawer_and_bloc/view/bloc_2.dart';
import 'package:d_navigation_drawer_and_bloc/view/bloc_3.dart';
import 'package:d_navigation_drawer_and_bloc/view/list_view_1.dart';
import 'package:d_navigation_drawer_and_bloc/view/list_view_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blue/blue_bloc.dart';
import 'bloc/blue/blue_state.dart';
import 'bloc/green/green_bloc.dart';
import 'bloc/green/green_state.dart';
import 'bloc/red/red_bloc.dart';
import 'bloc/red/red_state.dart';

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
      home: const MyHomePage(title: 'Aula 05 - Bloc e Navigation Drawer'),
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
  // Para o IndexedStack
  int _currentScreen = 1;

  // Alguns blocs para serem passados para mais de uma tela
  final RedBloc sharedRed = RedBloc(RedState(amount: 0));
  final GreenBloc sharedGreen = GreenBloc(GreenState(amount: 0));
  final BlueBloc sharedBlue = BlueBloc(BlueState(amount: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(index: _currentScreen, children: [
        ListView1(),
        ListView2(),
        MultiBlocProvider(providers: [
          BlocProvider(create: (_) => RedBloc(RedState(amount: 50))),
          BlocProvider(create: (_) => BlueBloc(BlueState(amount: 50))),
          BlocProvider(create: (_) => GreenBloc(GreenState(amount: 50))),
        ], child: const BlocExample1()),
        MultiBlocProvider(providers: [
          BlocProvider.value(value: sharedRed),
          BlocProvider.value(value: sharedGreen),
          BlocProvider.value(value: sharedBlue)
        ], child: const BlocExample2()),
        MultiBlocProvider(providers: [
          BlocProvider.value(value: sharedRed),
          BlocProvider.value(value: sharedGreen),
          BlocProvider.value(value: sharedBlue)
        ], child: const BlocExample3())
      ]),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Aplicativo Exemplo"),
            ),
            ListTile(
              title: const Text("ListView - Exemplo 1"),
              onTap: () {
                setState(() {
                  _currentScreen = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text("ListView - Exemplo 2"),
              onTap: () {
                setState(() {
                  _currentScreen = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text("BLOC - Exemplo 1"),
              onTap: () {
                setState(() {
                  _currentScreen = 2;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text("BLOC - Exemplo 2"),
              onTap: () {
                setState(() {
                  _currentScreen = 3;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text("BLOC - Exemplo 3"),
              onTap: () {
                setState(() {
                  _currentScreen = 4;
                  Navigator.pop(context);
                });
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    sharedBlue.close();
    sharedGreen.close();
    sharedRed.close();
    super.dispose();
  }
}
