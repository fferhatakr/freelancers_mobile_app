import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/projectAddWidget.dart';

class ProjectAddPage extends StatelessWidget {
  const ProjectAddPage({super.key});

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
                icon: Icons.comment,
                title: 'Notlar',
                title2: 'Ek notlarınızı Yazın',
              ),
              ElevatedButton(
                onPressed: () {
                  print('Kaydedildi');
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
