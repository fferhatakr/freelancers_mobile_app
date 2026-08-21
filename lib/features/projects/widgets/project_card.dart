import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
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
        final status =
            await showModalBottomSheet<(ProjectStatus, DateTime, double)>(
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
                              ProjectStatus.bekliyor,
                              DateTime.now(),
                              widget.project.projectAmount,
                            ));
                          },
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context, (
                              ProjectStatus.devamEdiyor,
                              DateTime.now(),
                              widget.project.projectAmount,
                            ));
                          },
                          title: Text(ProjectStrings.devamEdiyor),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context, (
                              ProjectStatus.tamamlandi,
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
              color: AppColors.realBlack,
              fontSize: AppSizes.size14,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.project.selectedCustomer.toString(),
                style: TextStyle(color: AppColors.realBlack),
              ),
              Text(
                result.toString(),
                style: TextStyle(color: AppColors.realBlack),
              ),
            ],
          ),

          trailing: Icon(
            Icons.chevron_right_outlined,
            color: AppColors.realBlack,
          ),
        ),
      ),
    );
  }
}

dynamic checkStatusColor(ProjectStatus? status) {
  if (status == ProjectStatus.bekliyor) {
    return AppColors.projectListColorOrange;
  } else if (status == ProjectStatus.devamEdiyor) {
    return AppColors.projectListColorBlue;
  } else if (status == ProjectStatus.tamamlandi) {
    return AppColors.projectListColorGreen;
  }
}
