import 'package:flutter/material.dart';

class AppColors {
  static const Color darkRed = Color(0xFF660012);
  static const Color gold = Color(0xFFC5A059);
  static const Color black = Color(0xFF1A1A1A);
  static const Color cream = Color(0xFFF2EBD4);
  static const Color white = Color(0xFFFFFFFF);
}

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.darkRed,
  scaffoldBackgroundColor: AppColors.darkRed, // Background dasar merah gelap
  fontFamily: 'Georgia', 
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: AppColors.black),
    bodyMedium: TextStyle(color: AppColors.black),
  ),
);