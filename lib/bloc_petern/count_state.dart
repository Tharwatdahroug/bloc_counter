class CounterState {
  final int counter;

  CounterState({this.counter});

  factory CounterState.initial() => CounterState(counter: 0);
}
