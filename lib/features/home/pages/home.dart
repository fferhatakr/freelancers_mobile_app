import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_list.dart';
import 'package:freelancer_tracking_system/features/dashboard/pages/dashboard.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_list.dart';
import 'package:freelancer_tracking_system/features/tasks/page/tasks_list.dart';
import 'package:freelancer_tracking_system/features/time_tracking/page/stop_watch.dart';
import 'package:freelancer_tracking_system/providers/navigation.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _sayfalar = [
    Dashboard(),
    ProjectList(),
    StopWatch(),
    CustomerList(),
    Tasks(),
  ];
  int _currentIndex = 0;
  final _items = [
    SalomonBottomBarItem(icon: Icon(Icons.home_outlined), title: Text('')),
    SalomonBottomBarItem(icon: Icon(Icons.article_outlined), title: Text('')),
    SalomonBottomBarItem(icon: Icon(Icons.access_time), title: Text('')),
    SalomonBottomBarItem(icon: Icon(Icons.person), title: Text('')),
    SalomonBottomBarItem(icon: Icon(Icons.task_alt_outlined), title: Text('')),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: context.read<NavigationProviders>(),
      builder: (context, secilenIndex, child) {
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: _sayfalar[secilenIndex],
              ),
              Positioned(
                left: 24,
                right: 24,
                bottom: 10,
                child: SafeArea(
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppRadius.r24),
                      boxShadow: [
                        BoxShadow(color: AppColors.white, blurRadius: 8),
                      ],
                    ),
                    child: SalomonBottomBar(
                      items: _items,
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                        context.read<NavigationProviders>().changeIndex(index);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
