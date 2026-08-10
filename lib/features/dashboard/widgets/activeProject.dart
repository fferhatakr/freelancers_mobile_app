import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_style.dart';
import 'package:freelancer_tracking_system/core/theme/language.dart';

class _ActiveProjects extends StatelessWidget {
  final Color containerColor;
  final Color containerIconColor;
  final IconData icon;
  final String title1;
  final String title2;
  final String title3;
  final Color containerTwoColor;

  const _ActiveProjects({
    required this.containerColor,
    required this.icon,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.containerTwoColor,
    required this.containerIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: ActiveProjectStyle.activeProjectCardColor,
          elevation: GeneralStyle.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(GeneralStyle.shapeSize),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(GeneralStyle.paddingSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: GeneralStyle.rowSpacing,
                  children: [
                    Container(
                      width: ActiveProjectStyle.containerWidht,
                      height: ActiveProjectStyle.containerWidht,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(GeneralStyle.paddingSize),
                        ),
                        color: containerColor,
                      ),
                      child: Icon(icon, color: containerIconColor),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title1, style: _title1Style()),
                        Text(title2, style: _title2Style()),
                        Text(title3, style: _title3Style()),
                      ],
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: containerTwoColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(GeneralStyle.borderRadius),
                          ),
                        ),
                        height: ActiveProjectStyle.miniContainer,
                        width: ActiveProjectStyle.miniContainer,
                        child: GestureDetector(
                          onTap: () {
                            print('object');
                          },
                          child: Icon(
                            Icons.chevron_right,
                            color: ActiveProjectStyle.iconChevronColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActiveProject extends StatefulWidget {
  const ActiveProject({super.key});

  @override
  State<ActiveProject> createState() => _ActiveProjectState();
}

class _ActiveProjectState extends State<ActiveProject> {
  late final List<_ActiveProjects> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      _ActiveProjects(
        containerColor: ActiveProjectStyle.containerGoldColor,
        containerIconColor: ActiveProjectStyle.containerIConGoldColor,
        icon: Icons.add_shopping_cart_rounded,
        title1: language.eTicaretSitesi,
        title2: language.interaktif,
        title3: language.bar,
        containerTwoColor: ActiveProjectStyle.containerGoldColor,
      ),
      _ActiveProjects(
        containerColor: ActiveProjectStyle.containerBlueColor,
        containerIconColor: ActiveProjectStyle.containerIconBlueColor,
        icon: Icons.phone_android_rounded,
        title1: language.mobileUygulama,
        title2: language.mobileApp,
        title3: language.bar,
        containerTwoColor: ActiveProjectStyle.containerBlueColor,
      ),
      _ActiveProjects(
        containerColor: ActiveProjectStyle.containerGoldColor,
        containerIconColor: ActiveProjectStyle.containerIConGoldColor,
        icon: Icons.admin_panel_settings_outlined,
        title1: language.yonetimPaneli,
        title2: language.dashboard,
        title3: language.bar,
        containerTwoColor: ActiveProjectStyle.containerGoldColor,
      ),
      _ActiveProjects(
        containerColor: ActiveProjectStyle.containerBlueColor,
        containerIconColor: ActiveProjectStyle.containerIconBlueColor,
        icon: Icons.language_outlined,
        title1: language.kurumsalWebsite,
        title2: language.webTasarim,
        title3: language.bar,
        containerTwoColor: ActiveProjectStyle.containerBlueColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(GeneralStyle.paddingSize),
          child: Text(
            language.aktifProje,
            style: TextStyle(
              fontSize: GeneralStyle.columnMiniTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: ActiveProjectStyle.activeProjectSizedBox,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: ((context, index) {
              return _items[index];
            }),
          ),
        ),
      ],
    );
  }
}

TextStyle _title1Style() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FastTransactionsCardStyle.fontSize,
    color: ActiveProjectStyle.textColor,
  );
}

TextStyle _title3Style() => TextStyle(color: ActiveProjectStyle.textColor);

TextStyle _title2Style() {
  return TextStyle(
    color: ActiveProjectStyle.textColor,
    fontSize: FastTransactionsCardStyle.title2fontSize,
  );
}
