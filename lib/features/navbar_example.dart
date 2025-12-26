import 'package:flutter/material.dart';

class NavbarExample extends StatefulWidget {
  const NavbarExample({super.key});

  @override
  State<NavbarExample> createState() => _NavbarExampleState();
}

class _NavbarExampleState extends State<NavbarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Row(

        children: [
          Text("Home"),
          Text("Profile"),
          Text("Stats"),
        ]
      ) ,
    );
  }
}
