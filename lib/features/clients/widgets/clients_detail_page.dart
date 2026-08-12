import 'package:flutter/material.dart';

class ClientsDetailPage extends StatelessWidget {
  final String adSoyad;
  final String email;
  final String telefon;
  final String? firma;
  final String? not;
  final String? adres;
  final String? source;
  final String? aciklama;
  ClientsDetailPage({
    required this.adSoyad,
    required this.email,
    required this.telefon,
    this.firma,
    this.not,
    this.adres,
    this.source,
    this.aciklama,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Müşteri Detayı'), centerTitle: true),
      body: SizedBox(
        width: double.infinity,
        height: 300,
        child: Card(
          color: Colors.blueGrey[200],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  spacing: 5,
                  children: [Icon(Icons.person_2_outlined), Text(adSoyad)],
                ),
                Row(spacing: 5, children: [Icon(Icons.call), Text(telefon)]),
                Row(
                  spacing: 5,
                  children: [Icon(Icons.mail_outline), Text(email)],
                ),
                Row(
                  spacing: 5,
                  children: [Icon(Icons.business), Text(firma ?? 'Girilmedi')],
                ),
                Row(
                  spacing: 5,
                  children: [Icon(Icons.note), Text(not ?? 'Girilmedi')],
                ),
                Row(
                  spacing: 5,
                  children: [Icon(Icons.home), Text(adres ?? 'Girilmedi')],
                ),
                Row(
                  spacing: 5,
                  children: [Icon(Icons.source), Text(source ?? 'Girilmedi')],
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.article),
                    Text(aciklama ?? 'Girilmedi'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
