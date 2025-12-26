import 'package:flutter/material.dart';

class WidgetBindingObserverExample extends StatefulWidget {
  const WidgetBindingObserverExample({super.key});

  @override
  State<WidgetBindingObserverExample> createState() =>
      _WidgetBindingObserverExampleState();
}

class _WidgetBindingObserverExampleState
    extends State<WidgetBindingObserverExample>
    with WidgetsBindingObserver {
  String currentAppState = "Initial";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("App state :: ${state}");
    switch (state) {
      case AppLifecycleState.resumed:
        setState(() {
          currentAppState = "RESUMED";
        });
        break;

      case AppLifecycleState.inactive:
        setState(() {
          currentAppState = "INACTIVE";
        });
        break;

      case AppLifecycleState.paused:
        setState(() {
          currentAppState = "PAUSED";
        });
        break;

      case AppLifecycleState.detached:
        setState(() {
          currentAppState = "DETACHED";
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(currentAppState)),
    );
  }
}
