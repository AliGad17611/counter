import 'package:bloc/bloc.dart';
import 'package:counter/cubit/counter_state.dart';

class CounterCubit extends Cubit<IncrementState> {
  CounterCubit() : super(IncrementState());
  int teamAScore = 0;
  int teamBScore = 0;
  void increment({required String team, required int button}) {
    if (team == 'A') {
      teamAScore += button;
    } else if (team == 'B') {
      teamBScore += button;
    } else {
      teamAScore = 0;
      teamBScore = 0;
    }
    emit(IncrementState());
  }
}

