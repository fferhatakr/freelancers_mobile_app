import 'package:flutter/material.dart';

import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';

class ClientFormField extends StatelessWidget {
  final IconData icon;
  final String title;
  final String title2;
  final TextEditingController controlText;
  final int? maxLines;
  final double? height;

  const ClientFormField({
    required this.icon,
    required this.title,
    required this.title2,
    required this.controlText,
    this.height,
    this.maxLines,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.size76,
      width: double.infinity,
      decoration: clientAddDecartion(),
      child: ListTile(
        leading: Icon(icon, size: AppSizes.size24, color: AppColors.green),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: _titleStyle()),
            SizedBox(
              height: height ?? AppSizes.size36,

              child: TextField(
                controller: controlText,
                decoration: InputDecoration(
                  hintMaxLines: maxLines ?? AppSizes.size2.toInt(),
                  hint: Text(title2, style: _hintStyle()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _hintStyle() {
    return TextStyle(fontSize: AppSizes.size12, color: AppColors.grey);
  }

  TextStyle _titleStyle() {
    return TextStyle(fontSize: AppSizes.size14, fontWeight: FontWeight.bold);
  }

  BoxDecoration clientAddDecartion() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r20)),
    );
  }
}
