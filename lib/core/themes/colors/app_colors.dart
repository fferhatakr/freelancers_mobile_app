// core/theme/app_colors.dart
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/providers/theme.dart';

class AppColors {
  AppColors._(); // instantiate edilmesin diye private constructor

  static const Color darkOrange = Color(0xFFE8683F);
  static const Color lightOrange = Color(0xFFFFAB91);
  static Color get private =>
      ThemeProvider().isDarkMode ? Colors.white : Colors.black;

  static Color get white =>
      ThemeProvider().isDarkMode ? Colors.black : Colors.white;

  static Color get black =>
      ThemeProvider().isDarkMode ? Colors.white : Colors.black;
  static Color get chartBackground =>
      ThemeProvider().isDarkMode ? Colors.grey[900]! : Colors.white;

  static Color get onPrimary =>
      ThemeProvider().isDarkMode ? Colors.grey : Colors.white;
  static Color get primary =>
      ThemeProvider().isDarkMode ? Colors.amber : Colors.blueAccent;
  static Color get watchColor =>
      ThemeProvider().isDarkMode ? Colors.white : Colors.black87;
  static Color get projectListColorBlue =>
      ThemeProvider().isDarkMode ? Colors.blue.shade900 : Colors.blue.shade100;
  static Color get projectListColorOrange => ThemeProvider().isDarkMode
      ? Colors.orange.shade900
      : Colors.orange.shade100;
  static Color get projectListColorGreen => ThemeProvider().isDarkMode
      ? Colors.green.shade900
      : Colors.green.shade100;
  static Color get cardBackground =>
      ThemeProvider().isDarkMode ? Colors.grey[900]! : Colors.white;
  static Color get classicColor => ThemeProvider().isDarkMode
      ? Color(0x1E293B)
      : AppColors.surfaceBlueGreyLight;

  static Color get classicTextColor =>
      ThemeProvider().isDarkMode ? AppColors.antrasit : Color(0xF8FAFC);
  static const Color antrasit = Color(0xFF1E293B);
  static const Color danger = Color(0xFFE53935);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA000);
  static const Color grey = Colors.grey;
  static const Color surfaceLight = Color(0xFFEEEEEE);
  static const Color purpleAccent = Colors.purpleAccent;
  static const Color surfaceBlueGreyLight = Color(0xFFECEFF1);
  static const Color realWhite = Colors.white;
  static const Color realBlack = Colors.black;

  // ClientsStyle'dan taşınanlar
  static const Color greyLight = Color.fromARGB(236, 239, 241, 241);
  static const Color greenDark = Color.fromARGB(255, 46, 125, 50);
  static const Color blueAccent = Colors.blueAccent;
  static const Color greenLight = Color.fromARGB(255, 223, 249, 224);

  // FastTransactionsCardStyle'dan taşınanlar
  static const Color purple = Color.fromARGB(255, 156, 39, 176);
  static const Color purpleLight = Color.fromARGB(255, 240, 153, 255);
  static const Color red = Color.fromARGB(255, 255, 53, 39);
  static const Color redLight = Color.fromARGB(255, 255, 195, 190);
  static const Color amber = Color.fromARGB(255, 255, 193, 7);
  static const Color amberLight = Color.fromARGB(255, 255, 245, 213);
  static const Color green = Color.fromARGB(255, 76, 175, 80);
  static const Color greenPale = Color.fromARGB(255, 196, 249, 198);

  // _FastCard içinde kullanılan (eskiden yanlışlıkla ActiveProjectStyle'dan geliyordu)
  static const Color cardDarkBackground = Color.fromARGB(255, 0, 27, 49);
}
