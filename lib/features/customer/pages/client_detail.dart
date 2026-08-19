import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';

class ClientsDetail extends StatelessWidget {
  final String name;
  final String email;
  final String telefon;
  final String? firma;
  final String? not;
  final String? adres;
  final String? source;
  final String? comment;
  const ClientsDetail({
    required this.name,
    required this.email,
    required this.telefon,
    this.firma,
    this.not,
    this.adres,
    this.source,
    this.comment,
    super.key,
  });
  final String _notAdded = 'Henüz Eklenmedi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CustomerStrings.musteriDetay,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p10),
        child: Column(
          spacing: AppSpacing.sm,
          children: [
            Center(
              child: Container(
                height: AppSizes.size108,
                width: AppSizes.size108,
                decoration: BoxDecoration(
                  color: AppColors.cardDarkBackground,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.amber),
                ),
                child: Center(
                  child: Text(name, style: TextStyle(color: AppColors.amber)),
                ),
              ),
            ),
            Card(
              color: AppColors.white,
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p10),
                child: Column(
                  spacing: AppSpacing.xs,
                  children: [
                    Row(
                      spacing: AppSpacing.xs,
                      children: [
                        Icon(Icons.person_2_outlined),
                        Text(
                          CustomerStrings.iletisimBilgileri,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      spacing: AppSpacing.xs,
                      children: [Icon(Icons.call), Text(telefon)],
                    ),
                    Divider(),
                    Row(
                      spacing: AppSpacing.xs,
                      children: [Icon(Icons.email_outlined), Text(email)],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: Column(
                  spacing: AppSpacing.xs,
                  children: [
                    Row(
                      spacing: AppSpacing.md,
                      children: [
                        Icon(Icons.person_2_outlined),
                        Text(
                          CustomerStrings.digerBilgiler,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    _AddDetail(
                      title: CustomerStrings.sirketBilgisi,
                      detail: firma,
                      icon: Icons.business,
                    ),
                    Divider(),
                    _AddDetail(
                      title: CustomerStrings.adresBilgisi,
                      detail: adres ?? _notAdded,
                      icon: Icons.home_outlined,
                    ),
                    Divider(),
                    _AddDetail(
                      title: CustomerStrings.not,
                      detail: not,
                      icon: Icons.note_outlined,
                    ),
                    Divider(),
                    _AddDetail(
                      title: CustomerStrings.referans,
                      detail: source ?? _notAdded,
                      icon: Icons.source_outlined,
                    ),
                    Divider(),
                    _AddDetail(
                      title: CustomerStrings.aciklamaEkle,
                      detail: comment,
                      icon: Icons.comment_bank_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddDetail extends StatelessWidget {
  final String? detail;
  final IconData icon;
  final String title;

  const _AddDetail({
    required this.detail,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpacing.sm,
      children: [
        Icon(icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.size14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(detail ?? '', style: TextStyle(fontSize: AppSizes.size12)),
          ],
        ),
      ],
    );
  }
}
