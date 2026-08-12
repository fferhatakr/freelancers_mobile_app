import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/projects/projectList.dart';
import 'package:freelancer_tracking_system/provider/project_provider.dart';
import 'package:provider/provider.dart';
import 'package:freelancer_tracking_system/provider/project_provider.dart';

class _OzetKarti extends StatelessWidget {
  final IconData ikon;
  final Color renk;
  final String baslik;
  final int deger;

  const _OzetKarti({
    required this.ikon,
    required this.renk,
    required this.baslik,
    required this.deger,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ActiveProjectStyle.activeProjectCardColor,
      elevation: GeneralStyle.elevation,
      child: Container(
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
                      color: renk,
                      borderRadius: BorderRadius.all(
                        Radius.circular(GeneralStyle.borderRadius),
                      ),
                    ),
                    child: Icon(ikon, color: OzetCardsStyle.iconColor),
                  ),
                  Text(baslik, style: cardtitle1Style()),
                  Text('$deger', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cards extends StatelessWidget {
  const cards({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ProjectProvider>().projectItems;
    final int totalProject = items.length;
    return InkWell(
      onTap: () {
        print('object');
      },
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
                  _OzetKarti(
                    ikon: Icons.home,
                    renk: OzetCardsStyle.homeColor,
                    baslik: language.aktifProjelerim,
                    deger: totalProject,
                  ),
                  _OzetKarti(
                    ikon: Icons.check,
                    renk: OzetCardsStyle.checkColor,
                    baslik: language.tamamlananProjeler,
                    deger: 3,
                  ),
                  _OzetKarti(
                    ikon: Icons.currency_lira,
                    renk: OzetCardsStyle.liraColor,
                    baslik: language.bekleyenOdeme,
                    deger: 3575,
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
    fontWeight: FontWeight.bold,
    fontSize: FastTransactionsCardStyle.fontSize,
  );
}

int calculatePayment() {
  int result = 0;
  for (int i in language().bekleyenOdemeler) {
    result += i;
  }
  return result;
}
