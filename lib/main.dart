import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_sample/counter_notifier.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Stopwatch Example', home: StopwatchPage());
  }
}

class StopwatchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      appBar: AppBar(title: Text('Stopwatch Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              watch(counterNotifier).time(),
              style: TextStyle(fontSize: 48.0),
            ),
            ElevatedButton(
              onPressed: () {
                if (context.read(counterNotifier).isRunning()) {
                  context.read(counterNotifier.notifier).stop();
                } else {
                  context.read(counterNotifier.notifier).start();
                }
              },
              child:
                  Text(watch(counterNotifier).isRunning() ? 'stop' : 'start'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read(counterNotifier.notifier).reset();
              },
              child: Text('reset'),
            ),
          ],
        ),
      ),
    );
  }
}
