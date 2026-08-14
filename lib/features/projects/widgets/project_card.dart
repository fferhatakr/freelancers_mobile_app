import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final String title;

  ProjectCard({required this.title, super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Status? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: InkWell(
        onTap: () async {
          final status = await showModalBottomSheet<Status>(
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
                          Navigator.pop(context, Status.bekliyor);
                        },
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context, Status.devamEdiyor);
                        },
                        title: Text('Devam Ediyor'),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context, Status.tamamlandi);
                        },
                        title: Text('Tamamlandı'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
          setState(() {
            selectedStatus = status;
          });
        },
        child: Card(
          color: checkStatusColor(selectedStatus),
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
              widget.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(selectedStatus?.label ?? 'Durum Belirtilmedi'),
            trailing: Icon(Icons.chevron_right_outlined),
          ),
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
