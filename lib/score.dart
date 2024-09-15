import 'package:flutter/cupertino.dart';
class Score extends StatelessWidget {
  final int item;
  final int teamAScore;
  final int teamBScore;
  const Score({super.key, required this.item, required this.teamAScore, required this.teamBScore});

  @override
  Widget build(BuildContext context) {
    return Text(
      ((item==0)?'$teamAScore':'$teamBScore'),
      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}

