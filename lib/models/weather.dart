import 'package:flutter/foundation.dart' show immutable;

/// Represents the weather information fetched from an API.
@immutable
class Weather {
  final Coord coord; // Coordinates of the location.
  final List<WeatherData> weather; // List of weather conditions.
  final String base; // Internal parameter, not typically used.
  final Main main; // Main weather information like temperature, humidity, etc.
  final int? visibility; // Visibility in meters.
  final Wind wind; // Wind information.
  final Rain? rain; // Rain information, can be null if there's no rain.
  final Clouds clouds; // Cloudiness information.
  final int dt; // Data receiving time in Unix, UTC.
  final Sys sys; // System information like sunrise/sunset.
  final int timezone; // Shift in seconds from UTC.
  final int id; // City ID.
  final String name; // City name.
  final int cod; // Internal parameter, not typically used.

  const Weather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  /// Factory constructor to create a Weather instance from JSON data.
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
    weather: (json['weather'] as List<dynamic>)
        .map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
        .toList(),
    base: json['base'] as String,
    main: Main.fromJson(json['main'] as Map<String, dynamic>),
    visibility: json['visibility'] ?? 0,
    wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
    rain: json['rain'] != null
        ? Rain.fromJson(json['rain'] as Map<String, dynamic>)
        : null,
    clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    dt: json['dt'] as int,
    sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    cod: json['cod'] as int,
  );
}

/// Represents the geographical coordinates.
@immutable
class Coord {
  final double lon; // Longitude.
  final double lat; // Latitude.

  const Coord({
    required this.lon,
    required this.lat,
  });

  /// Factory constructor to create a Coord instance from JSON data.
  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: (json['lon'] as num).toDouble(),
    lat: (json['lat'] as num).toDouble(),
  );
}

/// Represents the weather condition data.
@immutable
class WeatherData {
  final int id; // Weather condition ID.
  final String main; // Group of weather parameters (Rain, Snow, etc.).
  final String description; // Weather condition within the group.
  final String icon; // Weather icon ID.

  const WeatherData({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  /// Factory constructor to create a WeatherData instance from JSON data.
  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    id: json['id'] as int,
    main: json['main'] as String,
    description: json['description'] as String,
    icon: json['icon'] as String,
  );
}

/// Represents the main weather information.
@immutable
class Main {
  final double temp; // Temperature.
  final double feelsLike; // Perceived temperature.
  final double tempMin; // Minimum temperature.
  final double tempMax; // Maximum temperature.
  final int? pressure; // Atmospheric pressure.
  final int? humidity; // Humidity percentage.
  final int? seaLevel; // Sea level pressure.
  final int? grndLevel; // Ground level pressure.
  final int? visibility; // Visibility in meters.

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.visibility,
  });

  /// Factory constructor to create a Main instance from JSON data.
  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: (json['temp'] as num).toDouble(),
    feelsLike: (json['feels_like'] as num).toDouble(),
    tempMin: (json['temp_min'] as num).toDouble(),
    tempMax: (json['temp_max'] as num).toDouble(),
    pressure: json['pressure'],
    humidity: json['humidity'],
    seaLevel: json['sea_level'],
    grndLevel: json['grnd_level'],
    visibility: json['visibility'],
  );
}

/// Represents the wind information.
@immutable
class Wind {
  final double speed; // Wind speed.
  final int deg; // Wind direction in degrees.
  final double? gust; // Wind gust speed.

  const Wind({
    required this.speed,
    required this.deg,
    this.gust,
  });

  /// Factory constructor to create a Wind instance from JSON data.
  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: (json['speed'] as num).toDouble(),
    deg: json['deg'] ?? 0,
    gust: json['gust'] != null ? (json['gust'] as num).toDouble() : null,
  );
}

/// Represents the rain information.
@immutable
class Rain {
  final double? oneHour; // Rain volume for the last 1 hour.

  const Rain({this.oneHour});

  /// Factory constructor to create a Rain instance from JSON data.
  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(oneHour: (json['oneHour'] ?? 0.0).toDouble());
  }
}

/// Represents the cloudiness information.
@immutable
class Clouds {
  final int all; // Cloudiness percentage.

  const Clouds({
    required this.all,
  });

  /// Factory constructor to create a Clouds instance from JSON data.
  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all'] ?? 0);
  }
}

/// Represents the system information like sunrise and sunset times.
@immutable
class Sys {
  final int type; // Internal parameter, not typically used.
  final int id; // Internal parameter, not typically used.
  final String country; // Country code.
  final int sunrise; // Sunrise time in Unix, UTC.
  final int sunset; // Sunset time in Unix, UTC.

  const Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  /// Factory constructor to create a Sys instance from JSON data.
  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json['type'] ?? 0,
    id: json['id'] ?? 0,
    country: json['country'] ?? '',
    sunrise: json['sunrise'] ?? 0,
    sunset: json['sunset'] ?? 0,
  );
}
