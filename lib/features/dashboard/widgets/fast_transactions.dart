import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_add.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_add.dart';
import 'package:freelancer_tracking_system/features/tasks/page/task_add.dart';

class _FastCard extends StatelessWidget {
  final IconData iconOne;
  final String title1;
  final String title2;
  final VoidCallback onTap;

  const _FastCard({
    required this.iconOne,
    required this.title1,
    required this.title2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: cardBorderRadius()),
      child: Padding(
        padding: cardPadding(),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: AppSpacing.sm,
                children: [
                  SizedBox(
                    width: AppSizes.size40,
                    child: Container(
                      height: FastTransactionsCardStyle.sizeContainer,
                      width: FastTransactionsCardStyle.sizeContainer,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.surfaceBlueGreyLight,
                        ),
                        borderRadius: cardBorderRadius(),
                      ),
                      child: Icon(
                        iconOne,
                        color: AppColors.black,
                        size: AppSizes.size20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.size200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title1, style: title1Style()),
                        Text(title2, style: title2Style()),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: AppSizes.size48,
                    child: Container(
                      width: AppSizes.size28,
                      height: AppSizes.size28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppRadius.r16),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: AppSizes.size16,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FastTransactions extends StatefulWidget {
  const FastTransactions({super.key});

  @override
  State<FastTransactions> createState() => _FastTransactionsState();
}

class _FastTransactionsState extends State<FastTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DashboardStrings.hizliIslemler,
          style: TextStyle(
            fontSize: AppSizes.size16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSizes.size12),

        _FastCard(
          iconOne: Icons.person_add_outlined,
          title1: CustomerStrings.yeniMusteri,
          title2: CustomerStrings.musteriKaydiEkle,
          onTap: () {
            AppNavigation.navigateTo(context, CustomerAddScreen());
          },
        ),
        _FastCard(
          iconOne: Icons.assignment_outlined,
          title1: ProjectStrings.projeEkle,
          title2: ProjectStrings.yeniKazancSagla,
          onTap: () {
            AppNavigation.navigateTo(context, ProjectAdd());
          },
        ),
        _FastCard(
          iconOne: Icons.add_task_outlined,
          title1: ProjectStrings.gorevEkle,
          title2: ProjectStrings.projeniSaglamaAl,
          onTap: () {
            AppNavigation.navigateTo(context, TasksAdd());
          },
        ),
        SizedBox(height: AppSizes.size40),
      ],
    );
  }
}

BorderRadius cardBorderRadius() => BorderRadius.circular(AppRadius.r16);

EdgeInsetsGeometry cardPadding() => EdgeInsetsGeometry.all(AppPadding.p10);

TextStyle title2Style() {
  return TextStyle(color: AppColors.black, fontSize: AppSizes.size12);
}

TextStyle title1Style() {
  return TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.size14,
  );
}
