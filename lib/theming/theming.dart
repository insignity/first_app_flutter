import 'package:flutter/material.dart';

abstract class Theming {
  static ThemeData themeData = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      enabledBorder: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
    ),
  );
}
