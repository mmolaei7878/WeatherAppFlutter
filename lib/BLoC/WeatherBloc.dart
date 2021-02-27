import 'dart:async';

import 'package:WeatherAppFlutter/Model/MainWeatherModel.dart';
import 'package:WeatherAppFlutter/Repository/Repository.dart';

class WeatherBloc {
  StreamController<MainWeatherModel> _weatherController =
      StreamController<MainWeatherModel>();
  final repository = Repository();

  Stream<MainWeatherModel> get weatherStream => _weatherController.stream;

  close() {
    _weatherController.close();
  }

  getWeather() async {
    final response = await repository.getWeather();
    _weatherController.sink.add(response);
  }
}

final weatherController = WeatherBloc();
