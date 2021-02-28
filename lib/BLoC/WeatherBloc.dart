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
    if (weatherIcon.contains('01n') || weatherIcon.contains('01d')) {
      _weatherIConController.sink.add('lib/asset/images/sun.png');
    } else if (weatherIcon.contains('10n') || weatherIcon.contains('10d')) {
      _weatherIConController.sink.add('lib/asset/images/rain.png');
    } else if (weatherIcon.contains('02n') || weatherIcon.contains('02n')) {
      _weatherIConController.sink.add('lib/asset/images/cloud.png');
    } else if (weatherIcon.contains('13n') || weatherIcon.contains('13n')) {
      _weatherIConController.sink.add('lib/asset/images/snow.png');
    } else if (weatherIcon.contains('11n') || weatherIcon.contains('11n')) {
      _weatherIConController.sink.add('lib/asset/images/thunder.png');
    } else {
      _weatherIConController.sink.add('lib/asset/images/sun.png');
    }
  }
}

final weatherController = WeatherBloc();
