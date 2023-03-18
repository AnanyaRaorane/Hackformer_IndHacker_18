import 'package:dgame/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HPage extends StatefulWidget {
  const HPage({super.key});

  @override
  State<HPage> createState() => _HPageState();
}

class _HPageState extends State<HPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TextButton(
          onPressed: () {
            print("Tapped");
            Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => GamePage(),
                ));
          },
          child: Text("Play Game"),
        ),
      ),
    );
  }
}
