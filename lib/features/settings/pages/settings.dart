import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/settings/pages/contact_us.dart';
import 'package:freelancer_tracking_system/features/settings/pages/profile_info.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/profile_card.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/settings_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                await FirebaseAuth.instance.signOut();
                if (!context.mounted) return;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileCard(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hesap',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    SettingsCard(
                      icon: Icons.person_2_outlined,
                      title1: SettingsStrings.profilBilgileri,
                      title2: 'Ad,e-posta,meslek',
                      ontap: () {
                        AppNavigation.navigateTo(context, ProfileInfo());
                      },
                    ),
                    SettingsCard(
                      icon: Icons.security,
                      title1: SettingsStrings.guvenlik,
                      title2: SettingsStrings.guvenlikAciklama,
                      ontap: () {},
                    ),
                    SettingsCard(
                      icon: Icons.notifications_outlined,
                      title1: SettingsStrings.bildirimler,
                      title2: SettingsStrings.bildirimlerAciklama,
                      ontap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Görünüm',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    SettingsCard(
                      icon: Icons.language,
                      title1: SettingsStrings.dil,
                      title2: SettingsStrings.dilAciklama,
                      ontap: () {},
                    ),

                    SettingsCard(
                      icon: Icons.comment,
                      title1: SettingsStrings.bizeUlasin,
                      title2: SettingsStrings.bizeUlasinAciklama,
                      ontap: () {},
                    ),
                    SettingsCard(
                      icon: Icons.light_mode_outlined,
                      title1: 'Koyu Tema',
                      title2: 'Varsıyalan Light',
                      ontap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Destek',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    SettingsCard(
                      icon: Icons.help_outline,
                      title1: 'Yardım Merkezi',
                      title2: 'Yardım için dokunun',
                      ontap: () {},
                    ),

                    SettingsCard(
                      icon: Icons.comment,
                      title1: SettingsStrings.bizeUlasin,
                      title2: SettingsStrings.bizeUlasinAciklama,
                      ontap: () {
                        AppNavigation.navigateTo(context, ContactUs());
                      },
                    ),
                    SettingsCard(
                      icon: Icons.article_outlined,
                      title1: 'Gizlilik Politikası',
                      title2: 'Okumak için tıkla',
                      ontap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
