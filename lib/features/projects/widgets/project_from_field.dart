import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';

class ProjectFormField extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final String _title2;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const ProjectFormField({
    required this._icon,
    required this._title,
    required this._title2,
    required this.controller,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: AppSizes.size32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
          color: AppColors.greyLight,
        ),
        child: Center(
          child: ListTile(
            leading: Icon(_icon, size: AppSizes.size8, color: AppColors.amber),
            title: Text(
              _title,
              style: TextStyle(
                fontSize: AppSizes.size14,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: SizedBox(
              height: AppSizes.size40,
              child: TextField(
                textInputAction: TextInputAction.next,
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  hint: Text(_title2, style: TextStyle(color: AppColors.grey)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectionTile extends StatelessWidget {
  final IconData _icon2;
  final String _title2;
  final String _subtitle2;
  final VoidCallback? ontap;
  const SelectionTile({
    required this._icon2,
    required this._title2,
    required this._subtitle2,
    this.ontap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: AppSizes.size76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
          color: AppColors.greyLight,
        ),
        child: ListTile(
          onTap: ontap,
          leading: Icon(_icon2, size: AppSizes.size24, color: AppColors.amber),
          title: Text(
            _title2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.size14,
            ),
          ),
          subtitle: Text(_subtitle2),
          trailing: GestureDetector(child: Icon(Icons.chevron_right_outlined)),
        ),
      ),
    );
  }
}
