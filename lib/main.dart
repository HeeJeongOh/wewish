// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'src/home.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        'first': (context) => HomePage("first"),
        'second': (context) => HomePage("second"),
        'third': (context) => HomePage("third"),
        'fourth': (context) => HomePage("fourth"),
        'fifth': (context) => HomePage("fifth"),
      },
    );
  }
}
