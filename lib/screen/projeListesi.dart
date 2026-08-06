import 'package:flutter/material.dart';

class ListProject extends StatelessWidget {
  const ListProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proje Listesi')),
      body: Center(child: Text('Yakında gelecek')),
    );
  }
}
