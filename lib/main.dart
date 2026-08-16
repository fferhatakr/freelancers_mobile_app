import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_tracking_system/features/auth/pages/login_page.dart';
import 'package:freelancer_tracking_system/features/home/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/providers/navigation.dart';
import 'package:freelancer_tracking_system/providers/project.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Sahte veriler
  CustomerProvider().seedFakeData();
  TaskProvider().seedFakeData();
  ProjectProvider().seedFakeData();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomerProvider()),
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProviders()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late final Stream<User?> _authStream = FirebaseAuth.instance
      .authStateChanges();
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
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: _authStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          }
          return LoginPage();
        },
      ),
    );
  }
}
