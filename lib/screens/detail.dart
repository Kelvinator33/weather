import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/extensions/conversions.dart';
import 'package:weather/view/weather_info.dart';
import 'package:weather/weather_state/states.dart';
import 'package:weather/models/weather.dart';
import '../constants/design.dart';
import '../utils/get_weather_icons.dart';
import '../view/gradient.dart';

class detailscreen extends ConsumerWidget {
  const detailscreen({
    super.key,
    required this.city,
  });

  final String city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(city_state(city));
    bool isCelsius = true;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: weatherData.when(
        data: (weather) {
          int weatherCode = weather.weather[0].id;
          String weatherAnimationPath = getWeatherIcon(weatherCode: weatherCode);

          return Stack(
            children: [
              GradientContainer(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      // Country name text
                      Text(
                        weather.name,
                        style: TextStyles.h1,
                      ),
                      const SizedBox(height: 20),

                      // Today's date
                      Text(
                        DateTime.now().dateTime,
                        style: TextStyles.subtitleText,
                      ),

                      const SizedBox(height: 50),

                      // Weather icon big
                      SizedBox(
                        height: 300,
                        child: Lottie.asset(
                          weatherAnimationPath,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 50),

                      // Weather description
                      Text(
                        weather.weather[0].description.capitalize,
                        style: TextStyles.h2,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Weather info in a row
                  info(weather: weather, isCelsius: isCelsius),

                  const SizedBox(height: 15),
                ],
              ),

              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text(
              'An error has occurred',
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
