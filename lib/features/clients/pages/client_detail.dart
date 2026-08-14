import 'package:flutter/material.dart';

class ClientsDetail extends StatelessWidget {
  final String name;
  final String email;
  final String telefon;
  final String? firma;
  final String? not;
  final String? adres;
  final String? source;
  final String? comment;
  const ClientsDetail({
    required this.name,
    required this.email,
    required this.telefon,
    this.firma,
    this.not,
    this.adres,
    this.source,
    this.comment,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final String notAdded = 'Henüz Eklenmedi';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Müşteri Detayı',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Center(
              child: Container(
                height: 108,
                width: 108,
                decoration: BoxDecoration(
                  color: Color(0xFF1E293B),
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFFFC107)),
                ),
                child: Center(
                  child: Text(name, style: TextStyle(color: Color(0xFFFFC107))),
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 5,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.person_2_outlined),
                        Text(
                          'İletişim Bilgileri',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [Icon(Icons.call), Text(telefon)],
                    ),
                    Divider(),
                    Row(
                      spacing: 5,
                      children: [Icon(Icons.email_outlined), Text(email)],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 5,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.person_2_outlined),
                        Text(
                          'Diğer Bilgiler',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    _AddDetail(
                      title: 'Şirket Bilgisi',
                      detail: firma,
                      notAdded: firma ?? notAdded,
                      icon: Icons.business,
                    ),
                    Divider(),
                    _AddDetail(
                      title: 'Adres Bilgisi',
                      detail: adres,
                      notAdded: adres ?? notAdded,
                      icon: Icons.home_outlined,
                    ),
                    Divider(),
                    _AddDetail(
                      title: 'Not',
                      detail: not ?? notAdded,
                      icon: Icons.note_outlined,
                      notAdded: notAdded,
                    ),
                    Divider(),
                    _AddDetail(
                      title: 'Referans',
                      detail: source ?? notAdded,
                      icon: Icons.source_outlined,
                      notAdded: notAdded,
                    ),
                    Divider(),
                    _AddDetail(
                      title: 'Açıklama',
                      detail: comment ?? notAdded,
                      icon: Icons.comment_bank_outlined,
                      notAdded: notAdded,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddDetail extends StatelessWidget {
  const _AddDetail({
    super.key,
    required this.detail,
    required this.icon,
    required this.notAdded,
    required this.title,
  });

  final String? detail;
  final String notAdded;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(detail ?? notAdded, style: TextStyle(fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
