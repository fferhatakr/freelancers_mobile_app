import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/product/language.dart';
import 'package:freelancer_tracking_system/widget/cards.dart';
import 'package:freelancer_tracking_system/widget/fastTransactions.dart';
import 'package:freelancer_tracking_system/widget/statics.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text(language().hosgeldinKullanici),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [cards(), staticsLineChart(), fastTransactions()],
        ),
      ),
    );
  }
}
