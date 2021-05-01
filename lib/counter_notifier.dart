import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_sample/counter.dart';

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter());

  void start() {
    state = state.start();
  }
}

final counterNotifier = StateNotifierProvider<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});
