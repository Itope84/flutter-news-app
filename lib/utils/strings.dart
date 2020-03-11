import 'package:intl/intl.dart';

String capitalize(String s) =>
    s.length > 0 ? s[0].toUpperCase() + s.substring(1) : "";
String readableDate(String date) =>
    DateFormat.yMMMd('en_US').format(DateTime.parse(date));
