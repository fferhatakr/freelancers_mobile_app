// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';

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
                    labelText: SettingsStrings.adSoyad,
                    hintText: SettingsStrings.ferhatAkar,
                  ),
                  _EditingTextField(
                    labelText: SettingsStrings.meslek,
                    hintText: SettingsStrings.meslekDetay,
                  ),
                  _EditingTextField(
                    labelText: SettingsStrings.ePosta,
                    hintText: SettingsStrings.email,
                  ),
                  _EditingTextField(
                    labelText: SettingsStrings.telefon,
                    hintText: SettingsStrings.tel,
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
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.size12,
        vertical: AppSizes.size12,
      ),
      child: SizedBox(
        height: AppSizes.size40,
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
