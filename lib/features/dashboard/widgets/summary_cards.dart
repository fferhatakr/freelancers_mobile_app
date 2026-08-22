import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
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
        return Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r16)),
              ),
              color: AppColors.black,
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AppPadding.p10),
                      child: Row(
                        spacing: 5,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.work_outline, color: Colors.grey),

                              Text(
                                '${ProjectList().allProject.length}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                DashboardStrings.projelerim,
                                style: _summaryCardTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Icon(
                                Icons.check_box_outlined,
                                color: Colors.grey,
                              ),
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
                          SizedBox(width: 30),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Icon(Icons.payment_outlined, color: Colors.grey),
                              Text(
                                '${ProjectProvider().calPendingAndOngoing()} ₺',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(22, 163, 74, 1.0),
                                ),
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
            ),
          ],
        );
      },
    );
  }

  TextStyle _sumamryCardTwoStyle() {
    return TextStyle(
      fontSize: AppSizes.size20,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _summaryCardTextStyle() {
    return TextStyle(
      fontSize: 15,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
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
