import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final String title1;
  final String? title2;
  final VoidCallback ontap;

  const SettingsCard({
    required this.icon,
    required this.title1,
    this.title2,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p8),
            child: Row(
              children: [
                Icon(icon, size: AppSizes.size28, color: AppColors.black),
                SizedBox(width: AppSizes.size14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: TextStyle(
                        fontSize: AppSizes.size14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      title2 ?? '',
                      style: TextStyle(fontSize: AppSizes.size12),
                    ),
                  ],
                ),

                Spacer(),
                Icon(Icons.chevron_right_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
