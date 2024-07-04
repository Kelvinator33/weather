import 'package:jiffy/jiffy.dart';

extension FormatDateTime on DateTime {
  String get dateTime =>
      Jiffy.parseFromDateTime(this).format(pattern: 'yMMMMd');
}

extension DayOfWeek on DateTime {
  String get dayOfWeek => Jiffy.parseFromDateTime(this).format(pattern: 'EEEE');
}
extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
}
extension ConvertTimestampToTime on int {
  String get time =>
      Jiffy.parseFromMillisecondsSinceEpoch(this * 1000).format(pattern: 'Hm');

  String get dateTime => Jiffy.parseFromMillisecondsSinceEpoch(this * 1000)
      .format(pattern: 'yMMMMd');
}

extension Capitalize on String {
String get capitalize {
  return length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
}
}
