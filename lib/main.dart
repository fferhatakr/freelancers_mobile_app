import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/theme/theme.dart';
import 'package:freelancer_tracking_system/features/auth/pages/login_page.dart';
import 'package:freelancer_tracking_system/features/home/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freelancer_tracking_system/providers/customer.dart';
import 'package:freelancer_tracking_system/providers/navigation.dart';
import 'package:freelancer_tracking_system/providers/profile.dart';
import 'package:freelancer_tracking_system/providers/project.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:freelancer_tracking_system/providers/theme.dart';
import 'package:freelancer_tracking_system/providers/watch.dart';
import 'package:freelancer_tracking_system/features/auth/pages/onayla.dart';
import 'package:freelancer_tracking_system/providers/watch_record.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GoogleSignIn.instance.initialize();

  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  Hive.registerAdapter<TaskStatus>(TaskStatusAdapter());
  TaskProvider().box = await Hive.openBox<Task>("tasks");
  TaskProvider().loadTasks();

  Hive.registerAdapter<Project>(ProjectAdapter());
  Hive.registerAdapter<ProjectStatus>(ProjectStatusAdapter());
  ProjectProvider().box = await Hive.openBox<Project>("project");
  ProjectProvider().loadProject();

  Hive.registerAdapter<Customer>(CustomerAdapter());
  CustomerProvider().box = await Hive.openBox<Customer>("customer");
  CustomerProvider().loadCustomer();

  Hive.registerAdapter<Watch>(WatchAdapter());
  WatchRecord().box = await Hive.openBox<Watch>("watch");
  WatchRecord().loadWatch();

  Hive.registerAdapter<Profile>(ProfileAdapter());
  ProfileProvider().box = await Hive.openBox<Profile>("profile");
  ProfileProvider().loadProfile();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => WatchProvider()),
        ChangeNotifierProvider(create: (context) => WatchRecord()),
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
