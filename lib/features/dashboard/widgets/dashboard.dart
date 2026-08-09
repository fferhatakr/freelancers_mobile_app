import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/language.dart';
import 'package:freelancer_tracking_system/features/projects/projectList.dart';
import 'package:freelancer_tracking_system/features/dashboard/widgets/activeProject.dart';
import 'package:freelancer_tracking_system/features/dashboard/widgets/ozet_cards.dart';
import 'package:freelancer_tracking_system/features/dashboard/widgets/fastTransactions.dart';
import 'package:freelancer_tracking_system/features/dashboard/widgets/statics.dart';
import 'package:freelancer_tracking_system/features/settings/settings_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBackground,
      appBar: AppBar(
        backgroundColor: AppColors.dashboardBackground,
        title: Text(language.hosgeldinKullanici),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(
            onPressed: () {
              AppNavigation.navigateTo(context, SettingsScreen());
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            cards(),
            staticsLineChart(),
            ActiveProject(),
            fastTransactions(),
          ],
        ),
      ),
    );
  }
}
