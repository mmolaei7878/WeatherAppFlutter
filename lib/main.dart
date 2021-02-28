import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white, fontSize: 18),
            bodyText2: TextStyle(color: Colors.white60, fontSize: 18)),
      ),
      home: HomeScreen(),
    );
  }
}
