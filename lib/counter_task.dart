import 'package:counter/button.dart';
import 'package:counter/cubit/counter_cubit.dart';
import 'package:counter/cubit/counter_state.dart';
import 'package:counter/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, IncrementState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
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
                                teamAScore: BlocProvider.of<CounterCubit>(context).teamAScore,
                                teamBScore: BlocProvider.of<CounterCubit>(context).teamBScore,
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
                               ),
                                const SizedBox(height: 10),
                                Button(
                                    text: 'Add 2 points',
                                    item: item,
                                ),
                                const SizedBox(height: 10),
                                Button(
                                    text: 'Add 3 points',
                                    item: item,
                                     ),
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
              const Button(width: 200, text: 'Reset',item: -1,),
            ],
          ),
        );
      },
    );
  }
}
