class Current {
  final String? time;
  final int? interval;

  Current({
    required this.time,
    required this.interval,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    time: json["time"] as String?,
    interval: json["interval"] as int?,
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
  };
}

class Daily {
  final List<String> time;
  final List<int> weatherCode;
  final List<double> temperature2mMax;
  final List<double> temperature2mMin;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: List<String>.from(json["time"]),
      weatherCode: List<int>.from(json["weather_code"]),
      temperature2mMax: List<double>.from(json["temperature_2m_max"]),
      temperature2mMin: List<double>.from(json["temperature_2m_min"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "weather_code": weatherCode,
    "temperature_2m_max": temperature2mMax,
    "temperature_2m_min": temperature2mMin,
  };
}

class WeeklyWeather {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final DailyUnits dailyUnits;
  final Daily daily;

  WeeklyWeather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeeklyWeather.fromJson(Map<String, dynamic> json) {
    return WeeklyWeather(
      latitude: json["latitude"] ?? 0.0,
      longitude: json["longitude"] ?? 0.0,
      generationtimeMs: json["generationtime_ms"] ?? 0.0,
      utcOffsetSeconds: json["utc_offset_seconds"] ?? 0,
      timezone: json["timezone"] ?? '',
      timezoneAbbreviation: json["timezone_abbreviation"] ?? '',
      elevation: json["elevation"] ?? 0.0,
      currentUnits: CurrentUnits.fromJson(json["current_units"]),
      current: Current.fromJson(json["current"]),
      dailyUnits: DailyUnits.fromJson(json["daily_units"]),
      daily: Daily.fromJson(json["daily"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "current_units": currentUnits.toJson(),
    "current": current.toJson(),
    "daily_units": dailyUnits.toJson(),
    "daily": daily.toJson(),
  };
}



class CurrentUnits {
  final String? time;
  final String? interval;

  CurrentUnits({required this.time, required this.interval});

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
    time: json["time"] as String?,
    interval: json["interval"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
  };
}

class DailyUnits {
  final String? time;
  final String? weatherCode;
  final String? temperature2mMax;
  final String? temperature2mMin;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
    time: json["time"] as String?,
    weatherCode: json["weather_code"] as String?,
    temperature2mMax: json["temperature_2m_max"] as String?,
    temperature2mMin: json["temperature_2m_min"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "weather_code": weatherCode,
    "temperature_2m_max": temperature2mMax,
    "temperature_2m_min": temperature2mMin,
  };
}
