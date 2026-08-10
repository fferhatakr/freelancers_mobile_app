import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_tracking_system/features/dashboard/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
