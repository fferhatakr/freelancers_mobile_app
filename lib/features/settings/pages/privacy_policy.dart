import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/settings/privacy_policy_text.dart';

class GizlilikPolitika extends StatelessWidget {
  const GizlilikPolitika({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SettingsStrings.gizlilikPolitikasi)),
      body: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(GeneralStyle.paddingSize),
            child: Text(privacyPolicyText),
          ),
        ),
      ),
    );
  }
}
