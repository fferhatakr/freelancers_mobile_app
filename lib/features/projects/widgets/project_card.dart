import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/utils/project_status_style.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String? status;

  const ProjectCard({required this.title, this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        color: cardColor(status),
        elevation: 15,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: iconBackgraoundColor(status),
            child: Icon(icon(status), color: iconColor(status)),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(status ?? 'İşaretlenmedi'),
          trailing: Icon(Icons.chevron_right_outlined),
          onTap: () {
            print('object');
          },
        ),
      ),
    );
  }
}
