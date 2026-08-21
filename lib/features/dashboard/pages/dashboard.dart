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
        title: Text(
          '$_welcome\n${FirebaseAuth.instance.currentUser?.displayName}',
        ),
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
          spacing: AppSpacing.md,
          children: [
            SummaryCards(),
            Container(
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
                color: AppColors.white,
              ),
              child: StatisticsLiner(),
            ),
            FastTransactions(),
          ],
        ),
      ),
    );
  }
}
