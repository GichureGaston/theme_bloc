import 'package:flutter/material.dart';

enum AppTheme {
  Dark,
  Light,
}

final appThemeData = {
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
  ),
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
  ),
};
