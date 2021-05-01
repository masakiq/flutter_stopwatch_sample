import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_sample/counter.dart';
import 'dart:async';

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter());
  Timer _timer;

  void start() {
    state = state.start();
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      state = state.reloadStopwatch();
    });
  }

  void stop() {
    state = state.stop();
    _timer.cancel();
  }

  void reset() {
    state = state.reset();
    _timer.cancel();
  }
}

final counterNotifier = StateNotifierProvider<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});
