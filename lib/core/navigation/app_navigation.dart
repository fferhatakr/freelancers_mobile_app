import 'package:flutter/material.dart';

class AppNavigation {
  static dynamic navigateTo(BuildContext contex, Widget widget) {
    Navigator.of(contex).push(MaterialPageRoute(builder: (context) => widget));
  }
}

class AppNavigationReplace {
  static dynamic navigateTo(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => widget),
    );
  }
}
