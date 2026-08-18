import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/settings/pages/contact_us.dart';
import 'package:freelancer_tracking_system/features/settings/pages/privacy_policy.dart';
import 'package:freelancer_tracking_system/features/settings/pages/profile_info.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/profile_card.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/settings_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const double containerHeight = 36;
  static const double containerWidth = 48;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          SettingsStrings.ayarlar,
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
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(GeneralStyle.borderRadius),
                  ),
                  color: AppColors.danger,
                ),
                child: Icon(Icons.exit_to_app_outlined, color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GeneralStyle.paddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileCard(),
              _SettingsPadding(title: SettingsStrings.profilBilgileri),
              _profileCard(context),
              _SettingsPadding(title: SettingsStrings.gorunum),
              _gorunumCard(),
              _SettingsPadding(title: SettingsStrings.destek),
              _destekCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Card _profileCard(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SettingsCard(
            icon: Icons.person_2_outlined,
            title1: SettingsStrings.profilBilgileri,
            title2: SettingsStrings.adEposta,
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
    );
  }

  Card _gorunumCard() {
    return Card(
      child: Column(
        children: [
          SettingsCard(
            icon: Icons.language,
            title1: SettingsStrings.dil,
            title2: SettingsStrings.dilAciklama,
            ontap: () {},
          ),

          SettingsCard(
            icon: Icons.light_mode_outlined,
            title1: SettingsStrings.koyuTema,
            title2: SettingsStrings.varsayilan,
            ontap: () {},
          ),
        ],
      ),
    );
  }

  Card _destekCard(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SettingsCard(
            icon: Icons.help_outline,
            title1: SettingsStrings.yardimMerkezi,
            title2: SettingsStrings.yardimMerkeziAciklama,
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
            title1: SettingsStrings.gizlilikPolitikasi,
            title2: SettingsStrings.okumakTikla,
            ontap: () {
              AppNavigation.navigateTo(context, GizlilikPolitika());
            },
          ),
        ],
      ),
    );
  }
}

class _SettingsPadding extends StatelessWidget {
  const _SettingsPadding({required this.title});
  final String title;

  static const double fontSize = 16;

  TextStyle _textStyle() {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(GeneralStyle.paddingSize),
      child: Text(title, style: _textStyle()),
    );
  }
}
