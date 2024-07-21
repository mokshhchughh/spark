import 'package:flutter/material.dart';

sealed class AppThemes {
  const AppThemes._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: "Gilroy",
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: "Gilroy",
  );
}
