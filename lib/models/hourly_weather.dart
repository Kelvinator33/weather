import 'package:flutter/foundation.dart' show immutable;
import '/models/weather.dart';

/// Represents the hourly weather forecast data fetched from an API.
@immutable
class HourlyWeather {
  final String cod; // Response code.
  final int message; // Internal parameter, not typically used.
  final int cnt; // Number of time points in the forecast.
  final List<WeatherEntry> list; // List of weather entries.
  final City? city; // Information about the city.

  const HourlyWeather({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  /// Factory constructor to create an HourlyWeather instance from JSON data.
  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      cod: json['cod'] ?? '',
      message: json['message'] ?? 0,
      cnt: json['cnt'] ?? 0,
      list: (json['list'] as List<dynamic>)
          .map((entry) => WeatherEntry.fromJson(entry))
          .toList(),
      city: json['city'] != null ? City.fromJson(json['city']) : null,
    );
  }
}

/// Represents a single weather entry in the hourly forecast.
@immutable
class WeatherEntry {
  final int dt; // Time of the forecasted data, Unix, UTC.
  final Main main; // Main weather information like temperature, humidity, etc.
  final List<WeatherData> weather; // List of weather conditions.
  final Clouds clouds; // Cloudiness information.
  final Wind wind; // Wind information.
  final int visibility; // Visibility in meters.
  final dynamic pop; // Probability of precipitation.
  final Sys? sys; // System information, internal parameter.
  final Rain? rain; // Rain information, can be null if there's no rain.
  final String dtTxt; // Date and time in UTC.

  const WeatherEntry({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.rain,
    required this.dtTxt,
  });

  /// Factory constructor to create a WeatherEntry instance from JSON data.
  factory WeatherEntry.fromJson(Map<String, dynamic> json) {
    return WeatherEntry(
      dt: json['dt'] ?? 0,
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List<dynamic>)
          .map((weatherData) => WeatherData.fromJson(weatherData))
          .toList(),
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'] ?? 0,
      pop: json['pop'] ?? 0.0,
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      dtTxt: json['dt_txt'],
    );
  }
}

/// Represents the main weather information for a specific time point.
@immutable
class Main {
  final double temp; // Temperature.
  final double feelsLike; // Perceived temperature.
  final double tempMin; // Minimum temperature.
  final double tempMax; // Maximum temperature.
  final int pressure; // Atmospheric pressure.
  final int seaLevel; // Sea level pressure.
  final int grndLevel; // Ground level pressure.
  final int humidity; // Humidity percentage.
  final double tempKf; // Internal parameter, temperature coefficient.

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  /// Factory constructor to create a Main instance from JSON data.
  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: json['temp_kf'].toDouble(),
    );
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
    return Clouds(
      all: json['all'],
    );
  }
}

/// Represents the wind information.
@immutable
class Wind {
  final double speed; // Wind speed.
  final int deg; // Wind direction in degrees.
  final double gust; // Wind gust speed.

  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  /// Factory constructor to create a Wind instance from JSON data.
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
    );
  }
}

/// Represents the city information in the weather forecast.
class City {
  final int id; // City ID.
  final String name; // City name.
  final Coord coord; // Coordinates of the city.
  final String country; // Country code.
  final int population; // Population of the city.
  final int timezone; // Shift in seconds from UTC.
  final int sunrise; // Sunrise time in Unix, UTC.
  final int sunset; // Sunset time in Unix, UTC.

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  /// Factory constructor to create a City instance from JSON data.
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

/// Represents the geographical coordinates.
@immutable
class Coord {
  final double lat; // Latitude.
  final double lon; // Longitude.

  const Coord({
    required this.lat,
    required this.lon,
  });

  /// Factory constructor to create a Coord instance from JSON data.
  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
    );
  }
}

/// Represents the rain information.
@immutable
class Rain {
  final double threeHours; // Rain volume for the last 3 hours.

  const Rain({
    required this.threeHours,
  });

  /// Factory constructor to create a Rain instance from JSON data.
  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(threeHours: json['3h'] ?? 0.0);
  }
}

/// Represents the system information, such as part of day (day/night).
@immutable
class Sys {
  final String pod; // Part of day (n - night, d - day).

  const Sys({
    required this.pod,
  });

  /// Factory constructor to create a Sys instance from JSON data.
  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'] ?? '',
    );
  }
}
