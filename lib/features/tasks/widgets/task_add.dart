import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';

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
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueGrey[50],
      ),
      child: ListTile(
        leading: Icon(_icon, color: Colors.red),
        title: Text(
          _title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: SizedBox(
          height: 35,
          child: TextField(
            readOnly: onlyRead,
            maxLength: maxLength,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType ?? TextInputType.text,
            controller: controller,
            decoration: InputDecoration(hint: Text(_subtitle), counterText: ''),
            style: TextStyle(color: GeneralStyle.hintTextcolor),
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
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[50],
        ),
        child: ListTile(
          leading: Icon(_icon, size: 24, color: iconColor),
          title: Text(
            _title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          subtitle: Text(_subtitle),
          trailing: Icon(Icons.list),
        ),
      ),
    );
  }
}
