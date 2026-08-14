import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';

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
      elevation: GeneralStyle.elevation,
      child: Container(
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
                textInputAction: TextInputAction.next,
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  hint: Text(
                    _title2,
                    style: TextStyle(color: GeneralStyle.hintTextcolor),
                  ),
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
      elevation: GeneralStyle.elevation,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[50],
        ),
        child: ListTile(
          onTap: ontap,
          leading: Icon(_icon2, size: 24, color: Colors.amber[600]),
          title: Text(
            _title2,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          subtitle: Text(_subtitle2),
          trailing: GestureDetector(child: Icon(Icons.chevron_right_outlined)),
        ),
      ),
    );
  }
}
