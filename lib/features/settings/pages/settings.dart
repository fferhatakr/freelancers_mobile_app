import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
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
            children: [
              ProfileCard(),
              SettingsCard(
                icon: Icons.person_2_outlined,
                title1: SettingsStrings.profilBilgileri,
                title2: SettingsStrings.kisiselBilgiler,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.security,
                title1: SettingsStrings.guvenlik,
                title2: SettingsStrings.guvenlikAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.credit_card,
                title1: SettingsStrings.abonelik,
                title2: SettingsStrings.abonelikAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.image,
                title1: SettingsStrings.gorunum,
                title2: SettingsStrings.gorunumAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.notifications_outlined,
                title1: SettingsStrings.bildirimler,
                title2: SettingsStrings.bildirimlerAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.watch_later_outlined,
                title1: SettingsStrings.zamanTakibi,
                title2: SettingsStrings.zamanTakibiAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.data_object,
                title1: SettingsStrings.veriVeDepolama,
                title2: SettingsStrings.veriVeDepolamaAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.language,
                title1: SettingsStrings.dil,
                title2: SettingsStrings.dilAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.help_center_outlined,
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
            ],
          ),
        ),
      ),
    );
  }
}
