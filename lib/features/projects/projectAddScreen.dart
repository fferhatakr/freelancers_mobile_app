import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/projectAddWidget.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/tasks.dart';
import 'package:freelancer_tracking_system/provider/project_provider.dart';
import 'package:provider/provider.dart';

class ProjectAddPage extends StatelessWidget {
  final projectName = TextEditingController();
  final aciklama = TextEditingController();
  final projectAmount = TextEditingController();
  final note = TextEditingController();

  @override
  void dispose() {
    projectName.dispose();
    aciklama.dispose();
    projectAmount.dispose();
    note.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text(
          'Proje Ekle',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            spacing: 10,
            children: [
              ProjectAddWidget(
                controller: projectName,
                icon: Icons.task_sharp,
                title: 'Proje Adı',
                title2: 'Proje Adını Giriniz',
              ),
              secmeContanier(
                icon2: Icons.people,
                title2: 'Müşteri',
                subtitle2: 'Müşteri Seçin',
                onTap: () {
                  print('object');
                },
              ),
              ProjectAddWidget(
                controller: aciklama,
                icon: Icons.comment,
                title: 'Açıklama',
                title2: 'Proje Hakkında Detaylı Bilgi Girin',
              ),
              secmeContanier(
                icon2: Icons.calendar_month_outlined,
                title2: 'Başlangıç Tarihi',
                subtitle2: '09 Ağustos 2026',
                onTap: () {
                  print('object');
                },
              ),
              secmeContanier(
                icon2: Icons.calendar_month_outlined,
                title2: 'Bitiş Tarihi',
                subtitle2: 'Tarih Seçin',
                onTap: () {
                  print('object');
                },
              ),
              ProjectAddWidget(
                controller: TextEditingController(),
                icon: Icons.currency_lira_outlined,
                title: 'Proje Ücreti',
                title2: '₺ 0.00',
              ),
              secmeContanier(
                icon2: Icons.flag,
                title2: 'Durum',
                subtitle2: 'Planlandı',
                onTap: () {
                  print('object');
                },
              ),
              secmeContanier(
                icon2: Icons.star_border,
                title2: 'Öncelik',
                subtitle2: 'Orta',
                onTap: () {
                  print('object');
                },
              ),
              ProjectAddWidget(
                controller: note,
                icon: Icons.comment,
                title: 'Notlar',
                title2: 'Ek notlarınızı Yazın',
              ),
              ElevatedButton(
                onPressed: () {
                  final project = ProjectAddProvier(
                    projectName: projectName.text,
                  );
                  context.read<ProjectProvider>().addProject(project);
                  print('Kaydettik');
                  Navigator.pop(context);
                },
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: Colors.amber[600]),
                    Text('Kaydet', style: TextStyle(color: Colors.amber[600])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius ContainerBorderRadiusAll() =>
      BorderRadius.all(Radius.circular(10));
}
