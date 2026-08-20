import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';

class BillsInfo extends StatelessWidget {
  final String title;
  final IconData prefixIcon;
  final String hintTitle;
  final double? widht;
  final double? height;

  const BillsInfo({
    required this.title,
    required this.prefixIcon,
    required this.hintTitle,
    this.widht,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w400)),
        SizedBox(
          height: height ?? AppSizes.size48,
          width: widht ?? AppSizes.size170,
          child: TextField(
            maxLength: 20,
            decoration: InputDecoration(
              counterText: '',
              prefixIcon: Icon(prefixIcon),
              hintText: hintTitle,
              hintStyle: TextStyle(
                color: AppColors.grey,
                fontSize: AppSizes.size12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
