import 'package:flutter/material.dart';

class AppNavigation {
  static void navigateTo(BuildContext contex, Widget widget) {
    Navigator.of(contex).push(MaterialPageRoute(builder: (context) => widget));
  }
}
