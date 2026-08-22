import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';

class ThemeX {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blueAccent,
    scaffoldBackgroundColor: Color.fromRGBO(245, 247, 251, 1.0),
    cardTheme: CardThemeData(
      elevation: 10,
      shadowColor: Color.fromRGBO(160, 175, 192, 0.15),
    ),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: AppColors.black),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: 'Lora',
        color: AppColors.black,
        fontSize: AppSizes.size20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.amber,
    cardTheme: CardThemeData(elevation: 10),

    scaffoldBackgroundColor: Color.fromRGBO(01, 21, 37, 74),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: AppColors.black),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: 'Caveat',
        color: AppColors.black,
        fontSize: AppSizes.size20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
