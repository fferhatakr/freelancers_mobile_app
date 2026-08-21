import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_list.dart';
import 'package:freelancer_tracking_system/providers/project.dart';
import 'package:freelancer_tracking_system/providers/theme.dart';

class SummaryCards extends StatelessWidget {
  const SummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeProvider(),
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.r20)),
            color: AppColors.white,
          ),
          width: double.infinity,
          height: AppSizes.size108,
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        spacing: AppSpacing.xs,
                        children: [
                          Icon(Icons.work_outline),
                          Text(
                            '${ProjectList().allProject.length}',
                            style: _sumamryCardTwoStyle(),
                          ),
                          Text(
                            DashboardStrings.projelerim,
                            style: _summaryCardTextStyle(),
                          ),
                        ],
                      ),
                      VerticalDivider(color: AppColors.white),

                      Column(
                        spacing: AppSpacing.xs,
                        children: [
                          Icon(Icons.check_circle_outline_sharp),

                          Text(
                            '${ProjectProvider().completedProject.length}/${ProjectList().allProject.length}',
                            style: _sumamryCardTwoStyle(),
                          ),
                          Text(
                            DashboardStrings.tamamlanan,
                            style: _summaryCardTextStyle(),
                          ),
                        ],
                      ),
                      VerticalDivider(color: AppColors.white),
                      Column(
                        spacing: AppSpacing.xs,
                        children: [
                          Icon(Icons.currency_lira_outlined),

                          Text(
                            '${ProjectProvider().calPendingAndOngoing()} ₺',
                            style: _sumamryCardTwoStyle(),
                          ),
                          Text(
                            DashboardStrings.bekleyenOdeme,
                            style: _summaryCardTextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextStyle _sumamryCardTwoStyle() {
    return TextStyle(
      fontSize: AppSizes.size20,
      color: AppColors.realBlack,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _summaryCardTextStyle() {
    return TextStyle(color: AppColors.realBlack, fontWeight: FontWeight.w500);
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
      color: const Color.fromARGB(255, 38, 38, 38),
    );
  }
}

TextStyle cardtitle1Style() {
  return TextStyle(
    color: AppColors.realWhite,
    fontWeight: FontWeight.w400,

    fontSize: FastTransactionsCardStyle.fontSize,
  );
}
