import 'package:flutter/material.dart';

class NavigationProviders extends ValueNotifier<int> {
  NavigationProviders() : super(0);

  void changeIndex(int index) {
    value = index;
  }
}
