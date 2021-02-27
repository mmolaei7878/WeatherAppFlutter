import 'package:json_annotation/json_annotation.dart';

part 'MainWeatherModel.g.dart';

@JsonSerializable()
class MainWeatherModel {
  final Clouds clouds;
  final Main main;
  final Weather weather;
  final Wind wind;
  final String base;
  final int visibility;
  final int dt;
  final int timezone;
  final int id;
  final String name;
  MainWeatherModel(
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.base,
    this.dt,
    this.id,
    this.name,
    this.timezone,
    this.visibility,
  );
  factory MainWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherModelFromJson(json);
}

@JsonSerializable()
class Clouds {
  final int all;
  Clouds({this.all});
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@JsonSerializable()
class Main {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;
  Main(
      {this.feels_like,
      this.humidity,
      this.pressure,
      this.temp,
      this.temp_max,
      this.temp_min});
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;
  Weather({this.description, this.icon, this.id, this.main});
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@JsonSerializable()
class Wind {
  final double speed;
  final int deg;
  Wind({this.deg, this.speed});
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
