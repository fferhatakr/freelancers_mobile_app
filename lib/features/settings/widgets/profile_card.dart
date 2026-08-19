import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.size80,
      child: Card(
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Row(
            children: [
              Container(
                height: AppSizes.size48,
                width: AppSizes.size48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.amber,
                    width: AppSizes.size2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person),
              ),
              SizedBox(width: AppSizes.size12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SettingsStrings.ferhatAkar,
                    style: TextStyle(
                      fontSize: AppSizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    SettingsStrings.meslekDetay,
                    style: TextStyle(
                      fontSize: AppSizes.size14,
                      fontWeight: FontWeight.w400,
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
