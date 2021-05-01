import 'dart:async';

class Counter {
  Stopwatch _stopwatch;
  Timer _timer;
  String _time = '00:00:00';

  Counter() {
    _stopwatch = Stopwatch();
  }

  Counter start() {
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      return reloadStopwatch();
    });
    return this;
  }

  Counter reloadStopwatch() {
    var secs = _stopwatch.elapsedMilliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');

    _time = "$hours:$minutes:$seconds";
    return this;
  }

  String time() {
    return _time;
  }
}
