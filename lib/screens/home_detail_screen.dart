import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/extensions/conversions.dart';
import 'package:weather/view/gradient.dart';
import 'package:weather/view/weather_info.dart';
import 'package:weather/weather_state/states.dart';

import '../constants/design.dart';
import '../utils/get_weather_icons.dart';
import '../weather_state/states.dart';

class weatherscreen extends ConsumerWidget {
  final bool isCelsius;
  const weatherscreen({super.key, required this.isCelsius});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(current_state);

    return weatherData.when(
      data: (weather) {
        int weatherCode = weather.weather[0].id;
        String weatherAnimationPath = getWeatherIcon(weatherCode: weatherCode);

        double temperature = isCelsius
            ? weather.main.temp
            : ((weather.main.temp * 9 / 5) + 32).roundToDouble();
        String unit = isCelsius ? '°C' : '°F';

        return GradientContainer(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  weather.name,
                  style: TextStyles.h1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  DateTime.now().dateTime,
                  style: TextStyles.subtitleText,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 260, child: Lottie.asset(weatherAnimationPath)),
                const SizedBox(
                  height: 40,
                ),
                Text('${weather.weather[0].description} | $temperature.$unit', style: TextStyles.h2),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            info(weather: weather, isCelsius: isCelsius,),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyles.h2,
                ),

              ],
            ),
            const SizedBox(height: 50,),
            const hourlyforecast(),
          ],
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
