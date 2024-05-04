import 'package:flutter/cupertino.dart';
class Score extends StatefulWidget {
  final int item;
  final int teamAScore;
  final int teamBScore;
  const Score({super.key, required this.item, required this.teamAScore, required this.teamBScore});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {

  @override
  Widget build(BuildContext context) {
    return Text(
      ((widget.item==0)?'${widget.teamAScore}':'${widget.teamBScore}'),
      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}

