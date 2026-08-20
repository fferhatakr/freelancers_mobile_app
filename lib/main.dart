import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/theme/theme.dart';
import 'package:freelancer_tracking_system/features/auth/pages/login_page.dart';
import 'package:freelancer_tracking_system/features/home/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/providers/navigation.dart';
import 'package:freelancer_tracking_system/providers/project.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:freelancer_tracking_system/providers/theme.dart';
import 'package:freelancer_tracking_system/providers/watch.dart';
import 'package:freelancer_tracking_system/features/auth/pages/onayla.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Sahte veriler
  CustomerProvider().seedFakeData();
  TaskProvider().seedFakeData();
  ProjectProvider().seedFakeData();
  await GoogleSignIn.instance.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WatchProvider()),
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
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeProvider(),
      builder: (context, index) {
        return MaterialApp(
          localizationsDelegates: [GlobalMaterialLocalizations.delegate],
          supportedLocales: [const Locale('en'), const Locale('tr')],
          theme: ThemeProvider().isDarkMode
              ? ThemeX().darkTheme
              : ThemeX().lightTheme,

          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
            stream: _authStream,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  FirebaseAuth.instance.currentUser?.emailVerified == true) {
                return Home();
              } else if (snapshot.hasData &&
                  FirebaseAuth.instance.currentUser?.emailVerified == false) {
                return VerifyEmail();
              } else {
                return LoginPage();
              }
            },
          ),
        );
      },
    );
  }
}

/**ThemeData.light().copyWith(
        cardTheme: CardThemeData(elevation: 10),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
            fontSize: 20,
          ),
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ), */
