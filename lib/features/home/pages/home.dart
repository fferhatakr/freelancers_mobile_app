import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_list.dart';
import 'package:freelancer_tracking_system/features/dashboard/pages/dashboard.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_list.dart';
import 'package:freelancer_tracking_system/features/tasks/page/tasks_list.dart';
import 'package:freelancer_tracking_system/features/time_tracking/page/stop_watch.dart';
import 'package:freelancer_tracking_system/providers/navigation.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Varsayilan deger ana sayfa olan dashboard = 0
final List<Widget> _sayfalar = [
  Dashboard(),
  ProjectList(),
  ClientList(),
  Tasks(),
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: context.read<NavigationProviders>(),
      builder: (context, secilenIndex, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              AppNavigation.navigateTo(context, StopWatch());
            },
            child: Icon(Icons.alarm_outlined, color: Colors.black),
          ),
          body: _sayfalar[secilenIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              context.read<NavigationProviders>().changeIndex(value);
            },
            currentIndex: secilenIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: 'Project',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Client',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
            ],
          ),
        );
      },
    );
  }
}
