import 'package:c_bottom_navigation_bar_with_forms/view/first_screen.dart';
import 'package:c_bottom_navigation_bar_with_forms/view/second_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<Color> colors = [Colors.blue, Colors.green, Colors.red];
  List<double> size = [100, 200, 300, 400];
  int _index = 0;
  bool crossFadeFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      generateAnimatedContainer(),
      const Divider(),
      generateButtonForAnimatedContainer(),
      const Divider(),
      Expanded(
        child:
            Container(color: Colors.blue, child: generateAnimatedCrossFade()),
      ),
      const Divider(),
      generateButtonForAnimatedCrossFade()
    ]);
  }

  Widget generateAnimatedContainer() {
    return AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: colors[_index % colors.length],
        width: size[_index % size.length],
        height: size[_index % size.length],
        child: const Text("AnimatedContainer"));
  }

  Widget generateButtonForAnimatedContainer() {
    return ElevatedButton(
      child: const Text("Modifique o AnimatedContainer"),
      onPressed: () {
        setState(() {
          _index += 1;
        });
      },
    );
  }

  Widget generateAnimatedCrossFade() {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      firstChild: FirstScreen(),
      secondChild: const SecondScreen(),
      crossFadeState:
          crossFadeFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget generateButtonForAnimatedCrossFade() {
    return ElevatedButton(
      child: const Text("Modifique o CrossFade"),
      onPressed: () {
        setState(() {
          crossFadeFirst = !crossFadeFirst;
        });
      },
    );
  }
}
