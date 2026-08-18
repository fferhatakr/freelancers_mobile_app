import 'package:flutter/material.dart';
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
    final result = widget.project.status?.label.toString() ?? 'Tanımlanmadı';
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
                      title: Text('Bekliyor'),
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
                      title: Text('Devam Ediyor'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context, (
                          Status.tamamlandi,
                          DateTime.now(),
                          widget.project.projectAmount,
                        ));
                      },
                      title: Text('Tamamlandı'),
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
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey[300],
            child: Icon(Icons.assignment_outlined, color: Colors.white),
          ),
          title: Text(
            widget.project.projectName,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
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
