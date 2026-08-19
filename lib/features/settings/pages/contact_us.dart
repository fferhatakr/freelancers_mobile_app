import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsStrings.bizeUlasin),
        actions: [
          Text(SettingsStrings.website),
          IconButton(
            onPressed: () {
              launchURL('x');
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p8),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(SettingsStrings.geriDonus),

              SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: SettingsStrings.problemiAnlat,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(SettingsStrings.mesajGonder),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

mixin LaunchMixin {
  final Uri _url = Uri.parse('https://lumeonlimited.com');

  Future launchURL(String url) async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }
}
