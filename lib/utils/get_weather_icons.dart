import "package:lottie/lottie.dart";
String getWeatherIcon({
  required int weatherCode,
}) {
  String weatherCondition = '01d';

  switch (weatherCode) {
    case 800:
      weatherCondition = 'assets/sunny.json'; // Clear sky
      break;
    case 801:
    case 802:
    case 803:
    case 804:
    weatherCondition = 'assets/clouds.json'; // Few clouds
    break;
  // Atmosphere (mist, smoke, haze, etc.)
    case 701:
      weatherCondition = 'assets/misty.json';
      break;
    case 711: case 762: case 771:
      weatherCondition='assets/smoke.json'  ;
      break;
    case 721: case 731: case 751: case 761:
      weatherCondition='assets/haze.json';
      break;
    case 741:
    weatherCondition = 'assets/fog.json';
    break;
    case 781:
      weatherCondition='assets/tornado.json';
    break;
  // Snow
    case 600: case 601: case 602: case 611:
    case 612: case 613: case 615: case 616:
    case 620: case 621: case 622:
    weatherCondition = 'assets/snow.json';
    break;
  // Rain
    case 500: case 501: case 502: case 503:
    case 504: case 511: case 521:case 522: case 531:
      weatherCondition='assets/rainy.json';
      break;

      case 520: case 300:case 302:case 310:case 312:case 200: case 201: case 202: case 230:
    case 231: case 232:
    weatherCondition = 'assets/stormy.json';
    break;
  // Drizzle
     case 301: case 311:  case 313: case 314: case 321:
      weatherCondition = 'assets/icons/drizzle.json';
      break;
  // Thunderstorm
     case 210:
    case 211: case 212: case 221:
    weatherCondition = 'assets/storm';
    break;
    default:
      weatherCondition = 'assets/sunny.json'; // Default icon for unhandled cases
  }

  return weatherCondition;
}

//! Mpas weather codes (from opne-meteo) to image urls
String getWeatherIcon2(int id) {
  switch (id) {
    case 0:
      return 'assets/sunny.json'; // Clear sky
    case 1:
    case 2:
    case 3:
    case 45:
    case 48:
      return 'assets/clouds.json'; // Broken clouds
    case 53:
      return 'assets/misty.json'; // Mist
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
      return 'assets/rainy.json'; // Moderate rain
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
      return 'assets/stormy.json'; // Heavy rain
    case 80:
      return 'assets/storm.json'; // Thunderstorm

    case 81:
    case 82:
    case 83:
    case 84:
      return 'assets/snow.json'; // Snow showers
    case 90:
    case 91:
      return 'assets/fog.json'; // Fog
    default:
      return 'assets/icons/unknown.png'; // Default icon for unknown conditions
  }
}



/*

0: Clear sky
1: Mainly clear
2: Partly cloudy
3: Overcast
45: Fog
48: Depositing rime fog
51: Light drizzle
52: Moderate drizzle
53: Heavy drizzle
55: Freezing drizzle
56: Light freezing drizzle
57: Heavy freezing drizzle
61: Slight rain
63: Moderate rain
65: Heavy rain
66: Light freezing rain
67: Heavy freezing rain
71: Slight snowfall
73: Moderate snowfall
75: Heavy snowfall
77: Ice pellets
80: Light rain showers
81: Moderate rain showers
82: Violent rain showers
85: Light snow showers
86: Moderate snow showers
87: Violent snow showers

*/