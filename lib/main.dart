import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_tracking_system/features/auth/screens/login_page.dart';
import 'package:freelancer_tracking_system/features/clients/clientList.dart';
import 'package:freelancer_tracking_system/features/clients/widgets/clients_detail_page.dart';
import 'package:freelancer_tracking_system/features/dashboard/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freelancer_tracking_system/provider/client_provider.dart';
import 'package:freelancer_tracking_system/provider/project_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomerProvider()),
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
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
            return homePage();
          }
          return LoginPage();
        },
      ),
    );
  }
}


/**StreamBuilder<User?>(
        stream: _authStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return homePage();
          }
          return LoginPage();
        },
      ), */