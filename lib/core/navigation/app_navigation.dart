import 'package:flutter/material.dart';

class AppNavigation {
  static void navigateTo(BuildContext contex, Widget widget) {
    Navigator.of(contex).push(MaterialPageRoute(builder: (context) => widget));
  }
}

class AppNavigationReplace {
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => widget),
    );
  }
}
