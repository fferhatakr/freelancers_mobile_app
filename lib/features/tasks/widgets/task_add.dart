import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';

class TaskAdd extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final String _subtitle;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool onlyRead;

  const TaskAdd({
    required this._icon,
    required this._title,
    required this._subtitle,
    required this.controller,
    required this.maxLength,
    this.keyboardType,
    this.onlyRead = false,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.size76,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
        color: AppColors.white,
      ),
      child: ListTile(
        leading: Icon(_icon, color: AppColors.red),
        title: Text(
          _title,
          style: TextStyle(
            fontSize: AppSizes.size14,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        subtitle: SizedBox(
          height: AppSizes.size32,
          child: TextField(
            readOnly: onlyRead,
            maxLength: maxLength,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType ?? TextInputType.text,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
              ),
              hint: Text(_subtitle),
              counterText: '',
            ),
            style: TextStyle(color: AppColors.black),
          ),
        ),
      ),
    );
  }

  TextStyle listTileTitleOne() => TextStyle(fontWeight: FontWeight.bold);
}

class SelectionTask extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final String _subtitle;
  final VoidCallback onTap;
  final Color iconColor;

  const SelectionTask({
    required this._icon,
    required this._title,
    required this._subtitle,
    required this.onTap,
    required this.iconColor,

    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSizes.size76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
          color: AppColors.white,
        ),
        child: ListTile(
          leading: Icon(_icon, size: AppSizes.size24, color: iconColor),
          title: Text(
            _title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.size14,
            ),
          ),
          subtitle: Text(_subtitle),
          trailing: Icon(Icons.list),
        ),
      ),
    );
  }
}
