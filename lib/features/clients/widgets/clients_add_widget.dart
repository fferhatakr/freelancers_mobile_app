import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_style.dart';

class ClientAdd extends StatelessWidget {
  final IconData icon;
  final String title;
  final String title2;
  final dynamic controlText;
  const ClientAdd({
    required this.icon,
    required this.title,
    required this.title2,
    required this.controlText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ClientsStyle.containerHeight,
      width: double.infinity,
      decoration: ClientAddDecartion(),
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
              height: ClientsStyle.boxHeight,
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
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

  BoxDecoration ClientAddDecartion() {
    return BoxDecoration(
      color: ClientsStyle.containerColsor,
      borderRadius: BorderRadius.all(
        Radius.circular(GeneralStyle.radiusCircular),
      ),
    );
  }
}
