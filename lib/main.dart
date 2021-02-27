import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme:
            TextTheme(bodyText1: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      home: HomeScreen(),
    );
  }
}
