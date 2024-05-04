import 'package:counter/button.dart';
import 'package:counter/score.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int teamAScore = 0;
  int teamBScore = 0;
  void onPressed(int item, int count) {
    if (item == 0) {
      setState(() {
        teamAScore = teamAScore + count; // Increment teamAScore by count
      });
    } else if (item == 1) {
      setState(() {
        teamBScore = teamBScore + count; // Increment teamBScore by count
      });
    } else {
      setState(() {
        teamAScore = 0;
        teamBScore = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (index, item) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Team ${String.fromCharCode(65 + item)}',
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Score(
                            item: item,
                            teamAScore: teamAScore,
                            teamBScore: teamBScore,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                            horizontal: 20),
                        height: 130,
                        width: 5,
                        color: Colors.teal,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Button(
                                text: 'Add 1 point',
                                item: item,
                                onPressed: onPressed),
                            const SizedBox(height: 10),
                            Button(
                                text: 'Add 2 points',
                                item: item,
                                onPressed: onPressed),
                            const SizedBox(height: 10),
                            Button(
                                text: 'Add 3 points',
                                item: item,
                                onPressed: onPressed),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (index, item) {
                return const Divider(
                  color: Colors.teal,
                  thickness: 5,
                  indent: 30,
                  endIndent: 30,
                );
              },
              itemCount: 2),
          Button(width: 200, text: 'Reset', item: -1, onPressed: onPressed),
        ],
      ),
    );
  }
}
