import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height / 50) * 100,
      child: Text("Demo"),
    );
  }
}
