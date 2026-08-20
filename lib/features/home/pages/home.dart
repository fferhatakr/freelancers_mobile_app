import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
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
  CustomerList(),
  Tasks(),
];

class _HomeState extends State<Home> {
  final String _home = 'Home';
  final String _client = 'Client';
  final String _project = 'Project';
  final String _task = 'Task';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: context.read<NavigationProviders>(),
      builder: (context, secilenIndex, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.watchColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r30),
            ),
            onPressed: () {
              AppNavigation.navigateTo(context, StopWatch());
            },
            child: Icon(Icons.alarm_outlined, color: AppColors.white),
          ),
          body: _sayfalar[secilenIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              context.read<NavigationProviders>().changeIndex(value);
            },
            currentIndex: secilenIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: _home),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: _project,
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: _client),
              BottomNavigationBarItem(icon: Icon(Icons.task), label: _task),
            ],
          ),
        );
      },
    );
  }
}
