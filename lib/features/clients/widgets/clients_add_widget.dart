import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_tracking_system/core/theme/app_colors.dart';

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
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTile(
        leading: Icon(icon, size: 20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 15)),
            SizedBox(
              height: 24,
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  hint: Text(
                    title2,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.hintTextcolor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
