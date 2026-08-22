import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/localization/task_strings.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';

class ResultTask extends StatefulWidget {
  const ResultTask({super.key});

  @override
  State<ResultTask> createState() => _ResultTaskState();
}

class _ResultTaskState extends State<ResultTask> {
  final DateTime now = DateTime.now();
  final double zeroK = 0;
  @override
  Widget build(BuildContext context) {
    final projectCount = TaskProvider().value.length;
    return SizedBox(
      height: AppSizes.size108,
      child: Card(
        color: AppColors.greyLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppRadius.r16),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Row(
            spacing: AppSpacing.xs,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.article_outlined, color: AppColors.black),
                  Text(projectCount.toString(), style: _textStyle()),
                  Text(TaskStrings.result, style: _twoTextStyle()),
                ],
              ),
              VerticalDivider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_outlined, color: AppColors.green),
                  Text(zeroK.toString(), style: _textStyle()),
                  Text(TaskStrings.completed, style: _twoTextStyle()),
                ],
              ),
              VerticalDivider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.watch_later_outlined, color: AppColors.amber),

                  Text(zeroK.toString(), style: _textStyle()),
                  Text(TaskStrings.onGoing, style: _twoTextStyle()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _twoTextStyle() =>
      TextStyle(fontSize: AppSizes.size12, color: AppColors.black);

  TextStyle _textStyle() {
    return TextStyle(
      fontSize: AppSizes.size24,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    );
  }
}
