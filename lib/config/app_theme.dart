import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPink = Color(0xFFFF4081);
  static const Color darkBackground = Color(0xFF121212);
  static const Color cardBackground = Color(0xFF1E1E1E);
  static const Color navBackground = Color(0xFF181818);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: darkBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPink,
        brightness: Brightness.dark,
      ),
    );
  }
}
