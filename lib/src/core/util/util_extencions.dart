import 'package:intl/intl.dart';


String getCurrentDate() {
  DateTime now = DateTime.now();
  return DateFormat('kk:mm:ss EEE d MMM').format(now);
}

String getCurrentTime() {
  DateTime today = new DateTime.now();
  return "${today.hour}_${today.minute}_${today.second}_${today.millisecond}";
}