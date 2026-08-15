import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/dashboard/widgets/summary_cards.dart';
import 'package:freelancer_tracking_system/features/dashboard/widgets/fast_transactions.dart';
import 'package:freelancer_tracking_system/features/dashboard/widgets/statistics_linear.dart';
import 'package:freelancer_tracking_system/features/settings/pages/settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GeneralStyle.dashboardBackground,
      appBar: AppBar(
        backgroundColor: GeneralStyle.dashboardBackground,
        title: Text(DashboardStrings.hosgeldinKullanici),
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
        padding: EdgeInsets.all(GeneralStyle.paddingSize),
        child: Column(
          children: [SummaryCards(), StatisticsLiner(), FastTransactions()],
        ),
      ),
    );
  }
}
