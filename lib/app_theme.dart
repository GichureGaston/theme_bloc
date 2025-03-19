import 'package:flutter/material.dart';

enum AppTheme {
  Dark,
  Light,
  Green,
  Blue,
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
  AppTheme.Green: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  ),
  AppTheme.Blue: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
};
