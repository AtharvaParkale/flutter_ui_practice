import 'package:demo_app_three/main.dart';
import 'package:flutter/material.dart';

class RouteAwareExample extends StatefulWidget {
  const RouteAwareExample({super.key});

  @override
  State<RouteAwareExample> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RouteAwareExample> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // Called when this route is pushed
  @override
  void didPush() {
    print("HomeScreen: didPush");
  }

  // Called when another route is popped and this shows again
  @override
  void didPopNext() {
    print("HomeScreen: didPopNext");
    // 🔥 BEST PLACE to refresh data
  }

  // Called when a new route is pushed on top of this
  @override
  void didPushNext() {
    print("HomeScreen: didPushNext");
  }

  // Called when this route is popped
  @override
  void didPop() {
    print("HomeScreen: didPop");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Home")));
  }
}
