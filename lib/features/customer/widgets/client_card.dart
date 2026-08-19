import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/features/customer/pages/client_detail.dart';

class ClientCard extends StatelessWidget {
  final String name;
  final String email;
  final String telefon;
  final String? firma;
  final String? not;
  final String? adres;
  final String? source;
  final String? aciklama;
  const ClientCard({
    required this.name,
    required this.email,
    required this.telefon,
    this.firma,
    this.not,
    this.adres,
    this.source,
    this.aciklama,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigation.navigateTo(
          context,
          ClientsDetail(
            name: name,
            email: email,
            telefon: telefon,
            firma: firma,
            not: not,
            adres: adres,
            source: source,
            comment: aciklama,
          ),
        );
      },
      child: Card(
        shape: _listTileShape(),
        child: ListTile(
          leading: _CircleAvatar(),

          title: Text(name),
          subtitle: Column(
            children: [
              Row(
                spacing: AppSpacing.xs,
                children: [
                  Icon(Icons.email, size: AppSizes.size14),
                  Text(email),
                ],
              ),
              Row(
                spacing: AppSpacing.xs,
                children: [
                  Icon(Icons.call, size: AppSizes.size14),
                  Text(telefon),
                ],
              ),
            ],
          ),
          trailing: Icon(Icons.chevron_right_outlined),
        ),
      ),
    );
  }

  RoundedRectangleBorder _listTileShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r20)),
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.blueAccent,
      child: Icon(ClientsStyle.personIcon, color: AppColors.white),
    );
  }
}
