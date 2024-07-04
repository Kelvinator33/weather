import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/hourly_weather.dart';
import 'package:weather/models/weather.dart';
import '../models/weekly_weather.dart';
import 'geolocater.dart';

/// Immutable class containing methods to fetch weather data from OpenWeatherMap API.
@immutable
class method {
  // Base URL for the OpenWeatherMap API.
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5';

  // Latitude and longitude for location.
  static double lat = 0.0;
  static double lon = 0.0;

  // API key for OpenWeatherMap.
  static const String apikey = '4ab73ef0f6b24a81ec97b675de46186a';

  /// Get coordinates using geolocater.
  static Future<void> Location() async {
    final loc = await getLocation();
    lat = loc.latitude;
    lon = loc.longitude;
  }

  /// Fetch current weather data.
  static Future<Weather> cw() async {
    await Location(); // Get current location coordinates.
    final url = w_url(); // Get URL for current weather API.
    final response = await getData(url); // Fetch data from API.
    if (response == null) {
      throw Exception('Failed to load current weather data');
    }
    return Weather.fromJson(response); // Parse JSON data into Weather object.
  }

  /// Fetch hourly weather data.
  static Future<HourlyWeather> hw() async {
    await Location(); // Get current location coordinates.
    final url = f_url(); // Get URL for hourly weather API.
    final response = await getData(url); // Fetch data from API.
    if (response == null) {
      throw Exception('Failed to load hourly weather data');
    }
    return HourlyWeather.fromJson(response); // Parse JSON data into HourlyWeather object.
  }

  /// Fetch weekly weather data.
  static Future<WeeklyWeather> ww() async {
    await Location(); // Get current location coordinates.
    final url = wf_url(); // Get URL for weekly weather API.
    final response = await getData(url); // Fetch data from API.
    if (response == null) {
      throw Exception('Failed to load weekly weather data');
    }
    return WeeklyWeather.fromJson(response); // Parse JSON data into WeeklyWeather object.
  }

  /// Fetch weather data for a specific city.
  static Future<Weather> ccw({required String city}) async {
    final url = c_url(city); // Get URL for city weather API.
    final response = await getData(url); // Fetch data from API.
    if (response == null) {
      throw Exception('Failed to load city weather data');
    }
    return Weather.fromJson(response); // Parse JSON data into Weather object.
  }

  // URLs for the different API endpoints.

  /// URL for current weather data API.
  static String w_url() => '$BASE_URL/weather?lat=$lat&lon=$lon&units=metric&appid=$apikey';

  /// URL for hourly weather data API.
  static String f_url() => '$BASE_URL/forecast?lat=$lat&lon=$lon&units=metric&appid=$apikey';

  /// URL for city weather data API.
  static String c_url(String city) => '$BASE_URL/weather?q=$city&units=metric&appid=$apikey';

  /// URL for weekly weather data API.
  static String wf_url() => '$BASE_URL/onecall?lat=$lat&lon=$lon&exclude=current,minutely,hourly,alerts&units=metric&appid=$apikey';

  /// Generic method to fetch data from a given URL.
  static Future<Map<String, dynamic>?> getData(String url) async {
    print('Fetching data from: $url');
    try {
      final response = await http.get(Uri.parse(url)); // Make HTTP GET request.
      if (response.statusCode == 200) { // Check if the response is successful.
        final data = jsonDecode(response.body) as Map<String, dynamic>?; // Decode JSON data.
        if (data == null) {
          print('Failed to decode JSON data.');
          throw Exception('Failed to decode JSON data.');
        }
        print('Data fetched successfully: $data');
        return data; // Return decoded data.
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Failed to load weather data'); // Throw exception on failed response.
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to load weather data'); // Handle exceptions.
    }
  }
}
