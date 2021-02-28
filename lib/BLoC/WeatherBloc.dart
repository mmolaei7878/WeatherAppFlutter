import 'dart:async';
import 'package:intl/intl.dart';
import 'package:WeatherAppFlutter/Model/MainWeatherModel.dart';
import 'package:WeatherAppFlutter/Repository/Repository.dart';
import 'package:location/location.dart';

class WeatherBloc {
  StreamController<MainWeatherModel> _weatherController =
      StreamController<MainWeatherModel>();

  final repository = Repository();

  Stream<MainWeatherModel> get weatherStream => _weatherController.stream;

  StreamController<String> _weatherIConController = StreamController<String>();

  Stream<String> get weatherIConStream => _weatherIConController.stream;

  DateTime dummyObject;

  String currentTime;

  double _lat;
  double _lon;

  close() {
    _weatherController.close();
    _weatherIConController.close();
  }

  bool _serviceEnabled;
  getLocation() async {
    Location location = Location();

    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        _serviceEnabled = false;
        return;
      }
    }
    final locations = await location.getLocation();

    _lat = locations.latitude;
    _lon = locations.longitude;
    _serviceEnabled = true;
  }

  getWeather() async {
    await getLocation();
    if (!_serviceEnabled) {
      return;
    } else {
      final response = await repository.getWeather(lat: _lat, lon: _lon);
      _weatherController.sink.add(response);
      dummyObject = DateTime.fromMillisecondsSinceEpoch(response.dt * 1000);
      currentTime = DateFormat.yMMMEd().format(dummyObject);
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
}

final weatherController = WeatherBloc();
