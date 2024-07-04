import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/extensions/conversions.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/weather_state/states.dart';

import '../constants/design.dart';
import '../utils/get_weather_icons.dart';

class info extends StatelessWidget {
  const info({super.key, required this.weather, required this.isCelsius});
  final Weather weather;
  final bool isCelsius;

  @override
  Widget build(BuildContext context) {
    double temperature = isCelsius
        ? weather.main.temp
        : ((weather.main.temp * 9 / 5) + 32).roundToDouble();
    String unit = isCelsius ? '°C' : '°F';
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          infotile(
            title: 'Temp',
            value: '${temperature}$unit',
          ),
          infotile(
            title: 'Wind',
            value: '${weather.wind.speed.kmh} km/h',
          ),
          infotile(
            title: 'Humidity',
            value: '${weather.main.humidity}%',
          )

        ],
      ),
    );
  }
}

class infotile extends StatelessWidget {
  const infotile({super.key,required this.title, required this.value});


  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text(title, style: TextStyles.subtitleText,),
        const SizedBox(height: 10 ,),

        Text(value, style: TextStyles.h3,),


      ],
    );
  }
}

class hourlyforecast extends ConsumerWidget {
  const hourlyforecast({super.key,});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final hourdata=ref.watch(hourly_state);
    bool isCelsius=true;
    return hourdata.when(
        data: (hourweather){
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: hourweather.cnt,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                final weather=hourweather.list[index];
                double temperature = isCelsius
                    ? weather.main.temp
                    : (weather.main.temp * 9 / 5) + 32;
                return hourlytile(
                  id: weather.weather[0].id,
                  hour: weather.dt.time,
                  temp: temperature.round(),
                  isActive: index == 0,
            
                );
              },
            ),
          );
        },
        error: (error,stackTrace){
          return Center(child: Text(error.toString()));
        },
        loading: (){
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );
  }
}


class hourlytile extends StatelessWidget {
  const hourlytile({
    super.key,
    required this.id,
    required this.hour,
    required this.temp,
    required this.isActive,
  });

  final int id;
  final String hour;
  final int temp;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        top: 12,
        bottom: 12,
      ),
      child: Material(
        color: isActive ? AppColors.glossyBlack : AppColors.lightTransparentBlack,
        borderRadius: BorderRadius.circular(15.0),
        elevation: isActive ? 8 : 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                getWeatherIcon(weatherCode: id),
                width: 50,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hour,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$temp°',
                    style: TextStyles.h3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

