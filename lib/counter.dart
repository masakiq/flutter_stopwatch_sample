class Counter {
  Stopwatch _stopwatch;
  String _time = '00:00:00';

  Counter() {
    _stopwatch = Stopwatch();
  }

  Counter start() {
    _stopwatch.start();
    return this;
  }

  Counter stop() {
    _stopwatch.stop();
    return this;
  }

  Counter reset() {
    _stopwatch.stop();
    _stopwatch.reset();
    _time = '00:00:00';
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

  bool isRunning() {
    return _stopwatch.isRunning;
  }
}
