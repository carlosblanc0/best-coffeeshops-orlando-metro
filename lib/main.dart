import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Best Coffee Shops in the Orlando Metro Area',
      theme: ThemeData(
        primaryColor: Color(0xFF7B1FA2),
      ),
      home: HomePage(),
    );
  }
}
