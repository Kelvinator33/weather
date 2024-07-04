
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../SERVICES/methods.dart';
import '../models/weather.dart';

final current_state=FutureProvider.autoDispose((ref)async{
  return method.cw();
});
final hourly_state=FutureProvider.autoDispose((ref)async{
  return method.hw();
});
final weekly_state = FutureProvider.autoDispose((ref) async {
  try {
    await method.Location();
    final weeklyWeather = await method.ww();
    return weeklyWeather;
  } catch (e) {
    print('Error fetching weekly weather: $e');
    throw e;
  }
});

final city_state=FutureProvider.autoDispose.family<Weather , String>((ref, String city)async{
  return method.ccw(city: city);
});