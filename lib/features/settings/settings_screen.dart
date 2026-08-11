import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/features/auth/screens/login_page.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/avatar.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/settings_card.dart';
import 'package:freelancer_tracking_system/core/theme/language.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Ayarlar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(GeneralStyle.paddingSize),
            child: GestureDetector(
              onTap: () async {
                print('Çıkış');
                await FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, ModalRoute.withName("/"));
              },
              child: Container(
                height: 36,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(GeneralStyle.borderRadius),
                  ),
                  color: Colors.red,
                ),
                child: Icon(Icons.exit_to_app_outlined, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              avatarCards(),
              SettingsCard(
                icon: Icons.person_2_outlined,
                title1: language.profilBilgileri,
                title2: language.kisiselBilgiler,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.security,
                title1: language.guvenlik,
                title2: language.guvenlikAciklama,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.credit_card,
                title1: language.abonelik,
                title2: language.abonelikAciklama,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.image,
                title1: language.gorunum,
                title2: language.gorunumAciklama,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.notifications_outlined,
                title1: language.bildirimler,
                title2: language.bildirimlerAciklama,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.watch_later_outlined,
                title1: language.zamanTakibi,
                title2: language.zamanTakibiAciklama,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.data_object,
                title1: language.veriVeDepolama,
                title2: language.veriVeDepolamaAciklama,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.language,
                title1: language.dil,
                title2: language.dilAciklama,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.help_center_outlined,
                title1: language.dil,
                title2: language.dilAciklama,
                ontap: () {
                  print('object');
                },
              ),
              SettingsCard(
                icon: Icons.comment,
                title1: language.bizeUlasin,
                title2: language.bizeUlasinAciklama,
                ontap: () {
                  print('object');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
