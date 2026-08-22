import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _welcome,
              style: TextStyle(
                fontSize: AppSizes.size12,
                color: AppColors.black,
              ),
            ),
            Text(
              '${FirebaseAuth.instance.currentUser?.displayName}',
              style: TextStyle(color: AppColors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Color.fromRGBO(37, 99, 235, 1.0),
            ),
          ),
          IconButton(
            onPressed: () {
              AppNavigation.navigateTo(context, SettingsScreen());
            },
            icon: Icon(Icons.settings, color: Color.fromRGBO(37, 99, 235, 1.0)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.p10),
        child: Column(
          spacing: AppSpacing.md,
          children: [
            SummaryCards(),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r16)),
              ),
              color: AppColors.white,
              child: StatisticsLiner(),
            ),
            FastTransactions(),
            SizedBox(height: AppSizes.size48),
          ],
        ),
      ),
    );
  }
}
