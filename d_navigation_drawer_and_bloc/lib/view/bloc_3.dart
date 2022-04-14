import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blue/blue_bloc.dart';
import '../bloc/blue/blue_state.dart';
import '../bloc/green/green_bloc.dart';
import '../bloc/green/green_state.dart';
import '../bloc/red/red_bloc.dart';
import '../bloc/red/red_state.dart';

class BlocExample3 extends StatelessWidget {
  const BlocExample3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocBuilder<RedBloc, RedState>(builder: (context, state) {
        int r = state.amount;
        return Container(
            height: 100,
            width: double.infinity,
            color: Color.fromRGBO(r, 0, 0, 1));
      }),
      BlocBuilder<GreenBloc, GreenState>(builder: (context, state) {
        int g = state.amount;
        return Container(
            height: 100,
            width: double.infinity,
            color: Color.fromRGBO(0, g, 0, 1));
      }),
      BlocBuilder<BlueBloc, BlueState>(builder: (context, state) {
        int b = state.amount;
        return Container(
            height: 100,
            width: double.infinity,
            color: Color.fromRGBO(0, 0, b, 1));
      }),
      const Divider(
        thickness: 4,
      ),
      /*
      Fazendo este com watch
      */
      Builder(
        builder: (context) {
          final redState = context.watch<RedBloc>().state;
          final blueState = context.watch<BlueBloc>().state;
          final greenState = context.watch<GreenBloc>().state;
          return Container(
              height: 100,
              width: double.infinity,
              color: Color.fromRGBO(
                  redState.amount, greenState.amount, blueState.amount, 1));
        },
      ),
    ]);
  }
}
