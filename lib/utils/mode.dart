import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) {
  final brightness = MediaQuery.platformBrightnessOf(context);
  print(brightness);
  return brightness == Brightness.dark;
}
