import 'dart:async';

import 'package:WeatherAppFlutter/Model/MainWeatherModel.dart';
import 'package:WeatherAppFlutter/Repository/Repository.dart';

class WeatherBloc {
  StreamController<MainWeatherModel> _weatherController =
      StreamController<MainWeatherModel>();
  final repository = Repository();

  Stream<MainWeatherModel> get weatherStream => _weatherController.stream;

  StreamController<String> _weatherIConController = StreamController<String>();

  Stream<String> get weatherIConStream => _weatherIConController.stream;

  close() {
    _weatherController.close();
    _weatherIConController.close();
  }

  getWeather() async {
    final response = await repository.getWeather();
    _weatherController.sink.add(response);
    final String weatherIcon = response.weather.icon;
    switch (weatherIcon) {
      case '01n':
        _weatherIConController.sink.add('lib/asset/images/background.png');
        break;
      default:
    }
  }
}

final weatherController = WeatherBloc();
