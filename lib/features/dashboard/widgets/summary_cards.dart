import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_list.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const _SummaryCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ActiveProjectStyle.activeProjectCardColor,
      child: SizedBox(
        height: OzetCardsStyle.containerHeight,
        width: OzetCardsStyle.containerWidht,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(GeneralStyle.paddingSize),
              child: Column(
                spacing: OzetCardsStyle.spacing,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: OzetCardsStyle.miniWidht,
                    height: OzetCardsStyle.miniHeight,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(GeneralStyle.borderRadius),
                      ),
                    ),
                    child: Icon(icon, color: OzetCardsStyle.iconColor),
                  ),
                  Text(title, style: cardtitle1Style()),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryCards extends StatelessWidget {
  const SummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: OzetCardsStyle.generalContainerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(GeneralStyle.borderRadius),
          ),
          color: ActiveProjectStyle.activeProjectCardColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _SummaryCard(
                    icon: Icons.home,
                    color: OzetCardsStyle.homeColor,
                    title: DashboardStrings.aktifProjelerim,
                    value: '${ProjectList().allProject.length}',
                  ),
                  _SummaryCard(
                    icon: Icons.check,
                    color: OzetCardsStyle.checkColor,
                    title: DashboardStrings.tamamlananProjeler,
                    value: '${ProjectProvider().completedProject.length}',
                  ),
                  _SummaryCard(
                    icon: Icons.currency_lira,
                    color: OzetCardsStyle.liraColor,
                    title: DashboardStrings.bekleyenOdeme,
                    value: '${ProjectProvider().calPendingAndOngoing()} ₺',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle cardtitle1Style() {
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,

    fontSize: FastTransactionsCardStyle.fontSize,
  );
}
