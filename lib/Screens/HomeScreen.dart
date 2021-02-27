import 'package:WeatherAppFlutter/Model/MainWeatherModel.dart';
import 'package:flutter/material.dart';
import '../Repository/Repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repo = Repository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [],
      ),
    ));
  }
}
