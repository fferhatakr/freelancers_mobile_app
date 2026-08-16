// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Bilgileri'),
        actions: [TextButton(onPressed: () {}, child: Text('Kaydet'))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.amber),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.photo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _EditingTextField(
                    labelText: 'Ad Soyad',
                    hintText: 'Ferhat Akar',
                  ),
                  _EditingTextField(
                    labelText: 'Meslek',
                    hintText: 'Freelance Mobil Geliştirici',
                  ),
                  _EditingTextField(
                    labelText: 'E-posta',
                    hintText: 'test@gmail.com',
                  ),
                  _EditingTextField(
                    labelText: 'Telefon',
                    hintText: '+90 5XX XXX XX XX',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditingTextField extends StatelessWidget {
  const _EditingTextField({required this.labelText, required this.hintText});

  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        height: 45,
        child: TextField(
          decoration: InputDecoration(
            labelText: labelText,
            hint: Text(hintText),
            suffixIcon: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
