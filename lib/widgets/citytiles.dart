import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/constants/design.dart';
import 'package:weather/screens/detail.dart';
import 'package:weather/utils/get_weather_icons.dart';
import 'package:weather/weather_state/states.dart';

class citytile extends ConsumerWidget {
  const citytile({super.key, required this.index, required this.city});

  final String city;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherdata = ref.watch(city_state(city));

    return weatherdata.when(data: (weather) {
      return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> detailscreen(city: city),
            ),
          );
        },
        child: Material(
          color: index == 0
              ? AppColors.glossyBlack
              : AppColors.lightTransparentBlack,
          elevation: index == 0 ? 8 : 0,
          borderRadius: BorderRadius.circular(25.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            '${weather.main.temp.round().toString()}°',
                            style: TextStyles.h1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            weather.weather[0].description,
                            style: TextStyles.subtitleText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),
                    Lottie.asset(
                      getWeatherIcon(weatherCode: weather.weather[0].id),
                      width: 50,
                    ),
                  ],
                ),
                 Text(
                     weather.name,
                   style: TextStyle(
                     fontSize: 18,
                     color: Colors.white.withOpacity(.8),
                     fontWeight: FontWeight.w400,
                   ),
                 )
              ],
            ),
          ),
        ),
      );
    }, error: (error, stackTrace) {
      return Center(child: Text(error.toString()));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
