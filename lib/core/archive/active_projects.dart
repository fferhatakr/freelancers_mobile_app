import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';

class ActiveProjectsCard extends StatelessWidget {
  final Color containerColor;
  final Color containerIconColor;
  final IconData icon;
  final String title1;
  final String title2;
  final String title3;
  final Color containerTwoColor;

  const ActiveProjectsCard({
    required this.containerColor,
    required this.icon,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.containerTwoColor,
    required this.containerIconColor,
    super.key,
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
                          onTap: () {},
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

class ActiveProjects extends StatefulWidget {
  const ActiveProjects({super.key});

  @override
  State<ActiveProjects> createState() => _ActiveProjectsState();
}

class _ActiveProjectsState extends State<ActiveProjects> {
  late final List<ActiveProjectsCard> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      ActiveProjectsCard(
        containerColor: ActiveProjectStyle.containerGoldColor,
        containerIconColor: ActiveProjectStyle.containerIConGoldColor,
        icon: Icons.add_shopping_cart_rounded,
        title1: DashboardStrings.eTicaretSitesi,
        title2: DashboardStrings.interaktif,
        title3: DashboardStrings.bar,
        containerTwoColor: ActiveProjectStyle.containerGoldColor,
      ),
      ActiveProjectsCard(
        containerColor: ActiveProjectStyle.containerBlueColor,
        containerIconColor: ActiveProjectStyle.containerIconBlueColor,
        icon: Icons.phone_android_rounded,
        title1: DashboardStrings.mobileUygulama,
        title2: '',
        title3: DashboardStrings.bar,
        containerTwoColor: ActiveProjectStyle.containerBlueColor,
      ),
      ActiveProjectsCard(
        containerColor: ActiveProjectStyle.containerGoldColor,
        containerIconColor: ActiveProjectStyle.containerIConGoldColor,
        icon: Icons.admin_panel_settings_outlined,
        title1: DashboardStrings.yonetimPaneli,
        title2: '',
        title3: DashboardStrings.bar,
        containerTwoColor: ActiveProjectStyle.containerGoldColor,
      ),
      ActiveProjectsCard(
        containerColor: ActiveProjectStyle.containerBlueColor,
        containerIconColor: ActiveProjectStyle.containerIconBlueColor,
        icon: Icons.language_outlined,
        title1: DashboardStrings.kurumsalWebsite,
        title2: DashboardStrings.webTasarim,
        title3: DashboardStrings.bar,
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
            DashboardStrings.aktifProje,
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
