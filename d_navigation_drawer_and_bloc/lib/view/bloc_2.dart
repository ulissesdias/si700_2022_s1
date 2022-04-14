import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blue/blue_event.dart';
import '../bloc/blue/blue_bloc.dart';
import '../bloc/green/green_bloc.dart';
import '../bloc/green/green_event.dart';
import '../bloc/red/red_bloc.dart';
import '../bloc/red/red_event.dart';

class BlocExample2 extends StatelessWidget {
  const BlocExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RedBloc redBloc = BlocProvider.of<RedBloc>(context);
    GreenBloc greenBloc = BlocProvider.of<GreenBloc>(context);
    BlueBloc blueBloc = BlocProvider.of<BlueBloc>(context);

    return Column(
      children: [
        Row(children: [
          generateButton(redBloc, SemRed()),
          generateButton(redBloc, PoucoRed()),
          generateButton(redBloc, NormalRed()),
          generateButton(redBloc, MuitoRed()),
        ]),
        Row(children: [
          generateButton(greenBloc, SemGreen()),
          generateButton(greenBloc, PoucoGreen()),
          generateButton(greenBloc, NormalGreen()),
          generateButton(greenBloc, MuitoGreen()),
        ]),
        Row(children: [
          generateButton(blueBloc, SemBlue()),
          generateButton(blueBloc, PoucoBlue()),
          generateButton(blueBloc, NormalBlue()),
          generateButton(blueBloc, MuitoBlue()),
        ]),
      ],
    );
  }

  Widget generateButton(bloc, event) {
    // Esta linha de código recebe o provider.

    return ElevatedButton(
      child: Text("${event.runtimeType}"),
      onPressed: () {
        bloc.add(event);
      },
    );
  }
}
