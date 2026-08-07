import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/screen/dashboard.dart';
import 'package:freelancer_tracking_system/screen/projectList.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

// Varsayilan deger ana sayfa olan dashboard = 0
int _secilenIndex = 0;
final List<Widget> _sayfalar = [Dashboard(), ProjectList()];

class _homePageState extends State<homePage> {
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
