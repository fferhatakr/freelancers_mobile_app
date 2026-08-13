import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_style.dart';

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
      height: ClientsStyle.containerHeight,
      width: double.infinity,
      decoration: clientAddDecartion(),
      child: ListTile(
        leading: Icon(
          icon,
          size: GeneralStyle.iconSize,
          color: ClientsStyle.addIconColor,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: _titleStyle()),
            SizedBox(
              height: height ?? ClientsStyle.boxHeight,

              child: TextField(
                controller: controlText,
                decoration: InputDecoration(
                  hintMaxLines: maxLines ?? 2,
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
    return TextStyle(
      fontSize: GeneralStyle.hintTextSize,
      color: GeneralStyle.hintTextcolor,
    );
  }

  TextStyle _titleStyle() {
    return TextStyle(
      fontSize: GeneralStyle.fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  BoxDecoration clientAddDecartion() {
    return BoxDecoration(
      color: ClientsStyle.containerColsor,
      borderRadius: BorderRadius.all(
        Radius.circular(GeneralStyle.radiusCircular),
      ),
    );
  }
}
