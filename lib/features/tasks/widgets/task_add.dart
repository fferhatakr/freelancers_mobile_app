import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';

class TaskAdd extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final String _subtitle;
  final TextEditingController controller;

  const TaskAdd({
    required this._icon,
    required this._title,
    required this._subtitle,
    required this.controller,
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
        leading: Icon(_icon, color: const Color.fromARGB(255, 255, 38, 23)),
        title: Text(
          _title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: SizedBox(
          height: 35,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(hint: Text(_subtitle)),
            style: TextStyle(color: GeneralStyle.hintTextcolor),
          ),
        ),
      ),
    );
  }

  TextStyle listTileTitleOne() => TextStyle(fontWeight: FontWeight.bold);
}

class SelectionTask extends StatelessWidget {
  final IconData _icon2;
  final String _title2;
  final String _subtitle2;
  final VoidCallback onTap;
  const SelectionTask({
    required this._icon2,
    required this._title2,
    required this._subtitle2,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueGrey[50],
      ),
      child: ListTile(
        leading: Icon(
          _icon2,
          size: 24,
          color: Color.fromARGB(255, 245, 33, 18),
        ),
        title: Text(
          _title2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(_subtitle2),
        trailing: GestureDetector(
          onTap: onTap,
          child: Icon(Icons.chevron_right_outlined),
        ),
      ),
    );
  }
}
