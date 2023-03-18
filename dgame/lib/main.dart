import 'package:flutter/material.dart';
import 'package:hack_former/pages/homepage.dart';
import 'package:hack_former/pages/marketplace.dart';
import 'package:hack_former/widgets/pageview.dart';
//import 'package:hack_former/widgets/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PressStart2P',
        brightness: Brightness.dark,
      ),
      home: Scaffold(body: SafeArea(child: Customslider())),
    );
  }
}
