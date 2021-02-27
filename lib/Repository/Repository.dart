import 'dart:convert';

import '../Model/MainWeatherModel.dart';
import 'package:http/http.dart' as http;

class Repository {
  final apiKey = 'a075d4bcdb77876bbece4ed8e67f85e8';
  MainWeatherModel mainWeatherModel;
  Future<MainWeatherModel> getWeather() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=35.8400&lon=50.9391&appid=$apiKey';

    final response = await http.get(url);
    print(jsonDecode(response.body));
    return mainWeatherModel =
        MainWeatherModel.fromJson(jsonDecode(response.body));
  }
}
