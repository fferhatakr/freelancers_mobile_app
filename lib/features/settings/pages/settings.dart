import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/features/settings/pages/contact_us.dart';
import 'package:freelancer_tracking_system/features/settings/pages/privacy_policy.dart';
import 'package:freelancer_tracking_system/features/settings/pages/profile_info.dart';
import 'package:freelancer_tracking_system/features/settings/pages/sss.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/profile_card.dart';
import 'package:freelancer_tracking_system/features/settings/widgets/settings_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelancer_tracking_system/providers/theme.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key, this.selectedTheme});
  ThemeData? selectedTheme;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          SettingsStrings.ayarlar,
          style: TextStyle(
            fontSize: AppSizes.size24,
            fontWeight: FontWeight.bold,
          ),
        ),
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
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.danger,
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    if (!context.mounted) return;
                    Navigator.popUntil(context, ModalRoute.withName("/"));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: AppSpacing.md,
                    children: [
                      Icon(Icons.exit_to_app, color: AppColors.white),
                      Text('Exit', style: TextStyle(color: AppColors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _profileCard(BuildContext context) {
    return Card(
      color: AppColors.white,
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
      color: AppColors.white,
      child: Column(
        children: [
          SettingsCard(
            icon: Icons.language,
            title1: SettingsStrings.dil,
            title2: SettingsStrings.dilAciklama,
            ontap: () {},
          ),

          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.r16)),
            ),
            child: ListenableBuilder(
              listenable: ThemeProvider(),
              builder: (context, child) {
                return ListTile(
                  leading: ThemeProvider().isDarkMode == true
                      ? Icon(Icons.light_mode_outlined)
                      : Icon(Icons.light_mode_outlined, color: AppColors.amber),
                  title: ThemeProvider().isDarkMode == true
                      ? Text('Karanlık Mod')
                      : Text('Aydınlık Mod'),
                  trailing: Switch.adaptive(
                    value: ThemeProvider().isDarkMode,
                    onChanged: (value) {
                      ThemeProvider().toggleTheme();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Card _destekCard(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Column(
        children: [
          SettingsCard(
            icon: Icons.help_outline,
            title1: SettingsStrings.yardimMerkezi,
            title2: SettingsStrings.yardimMerkeziAciklama,
            ontap: () {
              AppNavigation.navigateTo(context, SSS());
            },
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

  TextStyle _textStyle() {
    return TextStyle(fontSize: AppSizes.size16, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p10),
      child: Text(title, style: _textStyle()),
    );
  }
}
