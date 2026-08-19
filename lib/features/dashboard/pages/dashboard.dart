import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';
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
  final String _welcome = 'Hoşgeldin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          '$_welcome ${FirebaseAuth.instance.currentUser?.displayName}',
        ),
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
        padding: EdgeInsets.all(AppPadding.p10),
        child: Column(
          children: [SummaryCards(), StatisticsLiner(), FastTransactions()],
        ),
      ),
    );
  }
}
