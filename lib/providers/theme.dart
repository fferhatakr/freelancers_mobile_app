import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider._sharedInstance();
  static final ThemeProvider _shared = ThemeProvider._sharedInstance();
  factory ThemeProvider() => _shared;

  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
