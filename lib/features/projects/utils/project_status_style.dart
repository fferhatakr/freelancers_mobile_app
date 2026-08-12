import 'package:flutter/material.dart';

Color cardColor(String? staus) {
  if (staus == 'Tamamlandı') {
    return Color(0xFFE8F8F0);
  } else if (staus == 'Beklemede') {
    return Color(0xFFFFF3E0);
  } else {
    return Color(0xFFE8F4FD);
  }
}

Color iconColor(String? status) {
  if (status == 'Devam Ediyor') {
    return Color(0xFF2196F3);
  } else if (status == 'Tamamlandı') {
    return Color(0xFF4CAF50);
  } else {
    return Color(0xFFFF9800);
  }
}

Color iconBackgraoundColor(String? status) {
  if (status == 'Tamamlandı') {
    return const Color.fromARGB(255, 166, 255, 155);
  } else if (status == 'Devam Ediyor') {
    return const Color.fromARGB(255, 176, 243, 251);
  } else {
    return const Color.fromARGB(255, 248, 198, 128);
  }
}

dynamic icon(String? status) {
  if (status == 'Tamamlandı') {
    return Icons.check;
  } else if (status == 'Devam Ediyor') {
    return Icons.change_circle_outlined;
  } else {
    return Icons.pending_outlined;
  }
}
