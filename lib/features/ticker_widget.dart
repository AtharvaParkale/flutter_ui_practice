import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerWidget extends StatefulWidget {
  const TickerWidget({super.key});

  @override
  State<TickerWidget> createState() => _TickerWidgetState();
}

class _TickerWidgetState extends State<TickerWidget>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;

  double elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {
        elapsedSeconds = elapsed.inMilliseconds / 1000;
      });
    });

    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: null, title: Text("Ticker Example")),
      body: Center(
        child: Text(
          elapsedSeconds.toStringAsFixed(0),
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
