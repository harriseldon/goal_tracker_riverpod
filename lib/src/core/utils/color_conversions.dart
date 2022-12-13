import 'package:flutter/material.dart';

class ColorConversions {
  static Color getFromString(String? colorValue) {
    if (colorValue == null || colorValue.isEmpty) {
      return Colors.black;
    } else {
      return Color(int.parse(colorValue));
    }
  }

  static String putToString(Color? color) => color?.value.toString() ?? '0';

  static Color getOptimalTextColor({required Color backgroundColor}) {
    const threshold = 105;
    final delta = (backgroundColor.red * 0.299 +
            backgroundColor.green * 0.587 +
            backgroundColor.blue * 0.114)
        .toInt();

    return (255 - delta < threshold) ? Colors.black : Colors.white;
  }
}
