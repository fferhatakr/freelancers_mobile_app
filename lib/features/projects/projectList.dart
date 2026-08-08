import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/projectListWidget.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  //İç içe yapmak için map kullandım
  static List<Map<String, String>> dummyProject = [
    {'ad': 'Ahmet Beye E-Ticaret Sitesi', 'durum': 'Devam Ediyor'},
    {'ad': 'Mehmet Beye Yönetim Paneli', 'durum': 'Tamamlandı'},
    {'ad': 'Nisa Hanıma Mobile App', 'durum': 'Tamamlandı'},
    {'ad': 'Rox Emlak Website', 'durum': 'Devam Ediyor'},
    {'ad': 'Migros Sanal Market App ', 'durum': 'Devam Ediyor'},
    {'ad': 'Getir Uygulaması Revize', 'durum': 'Tamamlandı'},
    {'ad': 'Trendyol Revize', 'durum': 'Beklemede'},
  ];
  static int resultProject = dummyProject.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proje Listesi')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLength: 30,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Hızlı Bul',
                hintText: 'Örnek:Ferhat Akar',
                hintStyle: TextStyle(color: Colors.grey),
                prefix: Icon(Icons.search),
              ),
            ),
            Text(
              'Toplam Proje: $resultProject',
              style: TextStyle(fontSize: 16),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dummyProject.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    title: dummyProject[index]['ad']!,
                    status: dummyProject[index]['durum']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
