import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_colors.dart';

class ProjectAddWidget extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final String _title2;

  const ProjectAddWidget({
    required this._icon,
    required this._title,
    required this._title2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueGrey[50],
      ),
      child: Center(
        child: ListTile(
          leading: Icon(_icon, size: 24, color: Colors.amber[600]),
          title: Text(
            _title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          subtitle: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hint: Text(
                  _title2,
                  style: TextStyle(color: AppColors.hintTextColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class secmeContanier extends StatelessWidget {
  final IconData _icon2;
  final String _title2;
  final String _subtitle2;
  final VoidCallback onTap;
  const secmeContanier({
    required this._icon2,
    required this._title2,
    required this._subtitle2,
    required this.onTap,
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
        leading: Icon(_icon2, size: 24, color: Colors.amber[600]),
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
