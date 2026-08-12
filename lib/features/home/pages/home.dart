import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/clients/pages/client_list.dart';
import 'package:freelancer_tracking_system/features/dashboard/pages/dashboard.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_list.dart';
import 'package:freelancer_tracking_system/features/tasks/page/tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Varsayilan deger ana sayfa olan dashboard = 0
int _secilenIndex = 0;
final List<Widget> _sayfalar = [
  Dashboard(),
  ProjectList(),
  ClientList(),
  Tasks(),
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sayfalar[_secilenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _secilenIndex = value;
          });
        },
        currentIndex: _secilenIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Project',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Client'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
        ],
      ),
    );
  }
}
