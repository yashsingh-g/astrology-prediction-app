import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF4d0099);
  static const Color primaryLight = Color(0xFF6600cc);
  static const Color accent = Color(0xFF00e6e6);
  
  // Background Colors
  static const Color background = Color(0xFF0d0015);
  static const Color cardBackground = Color(0xFF1a0033);
  static const Color surfaceLight = Color(0xFF330066);
  
  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFb3b3b3);
  static const Color textTertiary = Color(0xFF808080);
  
  // Zodiac Colors
  static const Map<String, Color> zodiacColors = {
    'aries': Color(0xFFff6b6b),
    'taurus': Color(0xFF51cf66),
    'gemini': Color(0xFfffd43b),
    'cancer': Color(0xFF748ffc),
    'leo': Color(0xFFff8787),
    'virgo': Color(0xFFa8e6cf),
    'libra': Color(0xFFffd3b6),
    'scorpio': Color(0xFFffaaa5),
    'sagittarius': Color(0xFF74b9ff),
    'capricorn': Color(0xFFa29bfe),
    'aquarius': Color(0xFF81ecec),
    'pisces': Color(0xFFfd79a8),
  };
  
  // Status Colors
  static const Color success = Color(0xFF51cf66);
  static const Color warning = Color(0xFFffd43b);
  static const Color error = Color(0xFFff6b6b);
  static const Color info = Color(0xFF748ffc);
  
  // Gradient Colors
  static const LinearGradient gradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1a0033),
      Color(0xFF4d0099),
    ],
  );
  
  static const LinearGradient gradientAccent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00e6e6),
      Color(0xFF0099cc),
    ],
  );
}
