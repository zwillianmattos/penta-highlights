import 'package:flutter/material.dart';
import 'package:penta/src/colors/color_theme.dart';

final ThemeData darkTheme = ThemeData.from(
  colorScheme: const ColorScheme(
    primary: colorPrimary,
    secondary: colorPrimary,
    surface: background,
    background: background,
    error: Color(0xFFB00020),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFF838792),
    onBackground: Color(0xFFEAEAEA),
    onError: Colors.white,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF838792)),
    bodyMedium: TextStyle(color: Color(0xFF2D2F38)),
  ),
  useMaterial3: false,
);
