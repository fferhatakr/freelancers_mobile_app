import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({required this.project, super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    final result =
        widget.project.status?.label.toString() ?? ProjectStrings.tanimlanmadi;
    return InkWell(
      onTap: () async {
        final status = await showModalBottomSheet<(Status, DateTime, double)>(
          context: context,
          builder: (context) {
            return SizedBox(
              width: double.infinity,
              child: Material(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(ProjectStrings.bekliyor),
                      onTap: () {
                        Navigator.pop(context, (
                          Status.bekliyor,
                          DateTime.now(),
                          widget.project.projectAmount,
                        ));
                      },
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context, (
                          Status.devamEdiyor,
                          DateTime.now(),
                          widget.project.projectAmount,
                        ));
                      },
                      title: Text(ProjectStrings.devamEdiyor),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context, (
                          Status.tamamlandi,
                          DateTime.now(),
                          widget.project.projectAmount,
                        ));
                      },
                      title: Text(ProjectStrings.tamamlandi),
                    ),
                  ],
                ),
              ),
            );
          },
        );

        if (status != null) {
          ProjectProvider().updateStatus(
            id: widget.project.id,
            status: status.$1,
            date: status.$2,
            money: status.$3,
          );
        }
      },
      child: Card(
        color: checkStatusColor(widget.project.status),
        elevation: 15,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r2)),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.grey,
            child: Icon(Icons.assignment_outlined, color: AppColors.white),
          ),
          title: Text(
            widget.project.projectName,
            style: TextStyle(
              fontSize: AppSizes.size14,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.project.selectedCustomer.toString()),
              Text(result.toString()),
            ],
          ),

          trailing: Icon(Icons.chevron_right_outlined),
        ),
      ),
    );
  }
}

enum Status {
  tamamlandi('Tamamlandı'),
  bekliyor('Bekliyor'),
  devamEdiyor('Devam Ediyor');

  final String label;
  const Status(this.label);
}

dynamic checkStatusColor(Status? status) {
  if (status == Status.bekliyor) {
    return const Color.fromARGB(255, 241, 145, 36);
  } else if (status == Status.devamEdiyor) {
    return const Color.fromARGB(255, 189, 224, 252);
  } else if (status == Status.tamamlandi) {
    return const Color.fromARGB(255, 109, 244, 113);
  }
}
