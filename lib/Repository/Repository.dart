import 'dart:convert';

import '../Model/MainWeatherModel.dart';
import 'package:http/http.dart' as http;

class Repository {
  final apiKey = '<<YOUR API KEY>>';
  MainWeatherModel mainWeatherModel;
  Future<MainWeatherModel> getWeather(
      {double lat = 35.6892, double lon = 51.3890}) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

    final response = await http.get(url);
    print(jsonDecode(response.body));
    return mainWeatherModel =
        MainWeatherModel.fromJson(jsonDecode(response.body));
  }
}
