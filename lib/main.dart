import 'package:flutter/material.dart';
import 'package:tic_tac/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        //Color(0xe6000926),
        shadowColor: const Color(0xFF001456),
        splashColor: const Color(0xFF4169e8),
      ),
      title: "Tic Tac Game",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
