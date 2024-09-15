import 'package:counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Button extends StatelessWidget {
  final double width;
  final Color background;
  final String text;
  final int item;

  const Button({
    super.key,
    this.width = double.infinity,
    this.background = Colors.teal,
    required this.text,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () {
          String numericString = text.replaceAll(RegExp(r'[^0-9]'), '');
          int buttonValue =
              numericString.isEmpty ? 0 : int.parse(numericString);
          BlocProvider.of<CounterCubit>(context).increment(
            team: item == 0
                ? 'A'
                : item == 1
                    ? 'B'
                    : 'reset',
            button: buttonValue,
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(5),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
