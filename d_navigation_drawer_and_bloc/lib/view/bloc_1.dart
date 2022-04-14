import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/red/red_bloc.dart';
import '../bloc/red/red_event.dart';
import '../bloc/red/red_state.dart';

class BlocExample1 extends StatelessWidget {
  const BlocExample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      generateBlocBuilder(),
      Row(
        children: [
          generateButton(context, SemRed()),
          generateButton(context, PoucoRed()),
          generateButton(context, NormalRed()),
          generateButton(context, MuitoRed()),
        ],
      )
    ]);
  }

  generateBlocBuilder() {
    return BlocBuilder<RedBloc, RedState>(builder: (context, state) {
      int r = state.amount;
      return AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: 100,
          width: double.infinity,
          color: Color.fromRGBO(r, 0, 0, 1));
    });
  }

  Widget generateButton(BuildContext context, RedEvent redEvent) {
    // Esta linha de código recebe o provider.
    RedBloc redBloc = BlocProvider.of<RedBloc>(context);
    return ElevatedButton(
      child: Text("${redEvent.runtimeType}"),
      onPressed: () {
        redBloc.add(redEvent);
      },
    );
  }
}
