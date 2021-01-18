import 'dart:wasm';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import './conut.dart';
import './count_state.dart';
import 'package:bloc/bloc.dart';

class counterBloc extends Bloc<CounterEvent, CounterState> {
  counterBloc() : super(initialState);

  static CounterState get initialState => CounterState.initial();

  // CounterState get initialState => CounterState.initial();
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is incrementCounter) {
      yield CounterState(counter: state.counter + 1);
    } else if (event is dcrementCounter) {
      yield CounterState(counter: state.counter - 1);
    }
  }

  void onIncremen() {
    add(incrementCounter());
  }

  void ondncremen() {
    add(dcrementCounter());
  }
}
