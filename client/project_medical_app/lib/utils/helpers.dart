import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeago/timeago.dart' as timeago;

class Helpers {
  static String timeagoText(DateTime dateTime, String locale) {
    return timeago.format(dateTime, locale: locale);
  }

  static Color darken(Color color, [double factor = 0.8]) {
    int a = color.alpha;
    int r = (color.red * factor).round();
    int g = (color.green * factor).round();
    int b = (color.blue * factor).round();
    return Color.fromARGB(a, min(r, 255), min(g, 255), min(b, 255));
  }

  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarBrightness:
            color == Colors.white ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
