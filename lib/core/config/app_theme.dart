import 'package:flutter/material.dart';

const darkPrimaryColor = Colors.black;
const darkSecondaryColor = Colors.white;

final darkAppTheme = ThemeData(
  scaffoldBackgroundColor: darkPrimaryColor,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: darkSecondaryColor,
    secondary: darkSecondaryColor,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: darkSecondaryColor),
);
