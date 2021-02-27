// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainWeatherModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeatherModel _$MainWeatherModelFromJson(Map<String, dynamic> json) {
  return MainWeatherModel(
    json['main'] == null
        ? null
        : Main.fromJson(json['main'] as Map<String, dynamic>),
    json['weather'] == null
        ? null
        : Weather.fromJson(json['weather'][0] as Map<String, dynamic>),
    json['clouds'] == null
        ? null
        : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
    json['base'] as String,
    json['dt'] as int,
    json['id'] as int,
    json['name'] as String,
    json['timezone'] as int,
    json['visibility'] as int,
  );
}

Map<String, dynamic> _$MainWeatherModelToJson(MainWeatherModel instance) =>
    <String, dynamic>{
      'clouds': instance.clouds,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'base': instance.base,
      'visibility': instance.visibility,
      'dt': instance.dt,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  return Clouds(
    all: json['all'] as int,
  );
}

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    feels_like: (json['feels_like'] as num)?.toDouble(),
    humidity: json['humidity'] as int,
    pressure: json['pressure'] as int,
    temp: (json['temp'] as num)?.toDouble(),
    temp_max: (json['temp_max'] as num)?.toDouble(),
    temp_min: (json['temp_min'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    description: json['description'] as String,
    icon: json['icon'] as String,
    id: json['id'] as int,
    main: json['main'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    deg: json['deg'] as int,
    speed: (json['speed'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };
