import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final String title1;
  final String title2;
  final VoidCallback ontap;

  const SettingsCard({
    required this.icon,
    required this.title1,
    required this.title2,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(icon, size: 28, color: Colors.amber[600]),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(title2, style: TextStyle(fontSize: 11)),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: ontap,
                  child: Icon(Icons.chevron_right_outlined),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
