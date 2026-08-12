import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/profile_card.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/settings_card.dart';
import 'package:freelancer_tracking_system/core/theme/Language.dart';
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
                title1: Language.profilBilgileri,
                title2: Language.kisiselBilgiler,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.security,
                title1: Language.guvenlik,
                title2: Language.guvenlikAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.credit_card,
                title1: Language.abonelik,
                title2: Language.abonelikAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.image,
                title1: Language.gorunum,
                title2: Language.gorunumAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.notifications_outlined,
                title1: Language.bildirimler,
                title2: Language.bildirimlerAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.watch_later_outlined,
                title1: Language.zamanTakibi,
                title2: Language.zamanTakibiAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.data_object,
                title1: Language.veriVeDepolama,
                title2: Language.veriVeDepolamaAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.language,
                title1: Language.dil,
                title2: Language.dilAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.help_center_outlined,
                title1: Language.dil,
                title2: Language.dilAciklama,
                ontap: () {},
              ),
              SettingsCard(
                icon: Icons.comment,
                title1: Language.bizeUlasin,
                title2: Language.bizeUlasinAciklama,
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
