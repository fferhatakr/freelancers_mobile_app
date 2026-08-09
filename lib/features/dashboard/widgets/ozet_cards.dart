import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/language.dart';
import 'package:freelancer_tracking_system/features/dashboard/widgets/fastTransactions.dart';

class _OzetKarti extends StatelessWidget {
  final IconData ikon;
  final Color renk;
  final String baslik;
  final String deger;

  const _OzetKarti({
    required this.ikon,
    required this.renk,
    required this.baslik,
    required this.deger,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.activeProjectCardColor,
      elevation: cardFeatures.Elevation,
      child: Container(
        height: cardFeatures.height,
        width: cardFeatures.widht,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: containerFeatures.widht,
                    height: containerFeatures.height,
                    decoration: BoxDecoration(
                      color: renk,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(ikon, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(baslik, style: cardtitle1Style()),
                  Text(deger, style: TextStyle(color: Colors.white)),
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
  cards({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('object');
      },
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.activeProjectCardColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _OzetKarti(
                    ikon: Icons.home,
                    renk: Colors.purple,
                    baslik: language.aktifProjelerim,
                    deger: '3',
                  ),
                  _OzetKarti(
                    ikon: Icons.check,
                    renk: Colors.green,
                    baslik: language.tamamlananProjeler,
                    deger: '3',
                  ),
                  _OzetKarti(
                    ikon: Icons.currency_lira,
                    renk: Colors.amber,
                    baslik: language.bekleyenOdeme,
                    deger: '3575',
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
    fontSize: FastTransactionsCard.fontSize,
  );
}

class cardFeatures {
  static double height = 110;
  static double widht = 117;
  static double Elevation = 10;
  static Color color = Colors.white;
}

class containerFeatures {
  static Color? homeColor = Colors.deepPurple[600];
  static Color? checkColor = Colors.green[600];
  static Color? moneyColor = Colors.amber[700];
  static double widht = 25;
  static double height = 25;
}

int calculatePayment() {
  int result = 0;
  for (int i in language().bekleyenOdemeler) {
    result += i;
  }
  return result;
}
