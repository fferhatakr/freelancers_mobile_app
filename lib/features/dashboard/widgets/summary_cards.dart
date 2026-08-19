import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_list.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const _SummaryCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });
  final double _private = 23;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardDarkBackground,
      child: SizedBox(
        height: AppSizes.size120,
        width: AppSizes.size108,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppPadding.p10),
              child: Column(
                spacing: AppSpacing.xs,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: _private,
                    height: _private,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppRadius.r10),
                      ),
                    ),
                    child: Icon(icon, color: AppColors.white),
                  ),
                  Text(title, style: cardtitle1Style()),
                  Text(
                    value,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: AppSizes.size14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryCards extends StatelessWidget {
  const SummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: AppSizes.size120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
          color: AppColors.cardDarkBackground,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _SummaryCard(
                    icon: Icons.home,
                    color: AppColors.purpleAccent,
                    title: DashboardStrings.aktifProjelerim,
                    value: '${ProjectList().allProject.length}',
                  ),
                  _SummaryCard(
                    icon: Icons.check,
                    color: AppColors.green,
                    title: DashboardStrings.tamamlananProjeler,
                    value: '${ProjectProvider().completedProject.length}',
                  ),
                  _SummaryCard(
                    icon: Icons.currency_lira,
                    color: AppColors.amber,
                    title: DashboardStrings.bekleyenOdeme,
                    value: '${ProjectProvider().calPendingAndOngoing()} ₺',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle cardtitle1Style() {
  return TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,

    fontSize: FastTransactionsCardStyle.fontSize,
  );
}
