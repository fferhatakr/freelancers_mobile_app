import 'package:flutter/material.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proje Listesi')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          maxLength: 30,
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Hızlı Bul',
            hintText: 'Örnek:Ferhat Akar',
            hintStyle: TextStyle(color: Colors.grey),
            prefix: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
