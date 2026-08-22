import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_detail.dart';

class CustomerCard extends StatelessWidget {
  final String name;
  final String email;
  final String telefon;
  final String? firma;
  final String? not;
  final String? adres;
  final String? source;
  final String? aciklama;
  const CustomerCard({
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
          CustomerDetail(
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
        color: AppColors.white,
        shape: _listTileShape(),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromRGBO(37, 99, 235, 0.1),
            child: Text(
              '${name[0]}',
              style: TextStyle(color: Color.fromRGBO(37, 99, 235, 1.0)),
            ),
          ),

          title: Text(name, style: TextStyle(color: AppColors.black)),
          subtitle: Column(
            children: [
              Row(
                spacing: AppSpacing.xs,
                children: [
                  Icon(Icons.email, size: AppSizes.size14),
                  Text(email, style: TextStyle(color: AppColors.black)),
                ],
              ),
              Row(
                spacing: AppSpacing.xs,
                children: [
                  Icon(Icons.call, size: AppSizes.size14),
                  Text(telefon, style: TextStyle(color: AppColors.black)),
                ],
              ),
            ],
          ),
          trailing: Icon(Icons.chevron_right_outlined, color: AppColors.black),
        ),
      ),
    );
  }

  RoundedRectangleBorder _listTileShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r24)),
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.circleColor,
      child: Icon(ClientsStyle.personIcon, color: AppColors.iconColor),
    );
  }
}
