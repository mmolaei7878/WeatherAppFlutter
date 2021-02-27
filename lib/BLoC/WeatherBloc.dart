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
      _weatherIConController.sink.add('lib/asset/svg/cloudyDay.svg');
    } else if (weatherIcon.contains('10n') || weatherIcon.contains('10d')) {
      _weatherIConController.sink.add('lib/asset/svg/rainy.svg');
    } else if (weatherIcon.contains('11n') || weatherIcon.contains('11d')) {
      _weatherIConController.sink.add('lib/asset/svg/thunder.svg');
    } else if (weatherIcon.contains('13n') || weatherIcon.contains('13n')) {
      _weatherIConController.sink.add('lib/asset/svg/snowy.svg');
    } else {
      _weatherIConController.sink.add('lib/asset/svg/rainy.svg');
    }
  }
}

final weatherController = WeatherBloc();
