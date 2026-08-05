import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/product/language.dart';
import 'package:freelancer_tracking_system/widget/fastTransactions.dart';

class cards extends StatelessWidget {
  cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          color: cardFeatures.color,
          elevation: cardFeatures.Elevation,
          child: InkWell(
            onTap: () {
              print('Tapped');
            },
            child: Container(
              height: cardFeatures.height,
              width: cardFeatures.widht,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: containerFeatures.widht,
                          height: containerFeatures.height,
                          decoration: BoxDecoration(
                            color: containerFeatures.homeColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Icon(Icons.home, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          language().aktifProjelerim,
                          style: cardtitle1Style(),
                        ),
                        Text(language().aktifProjeler.length.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          color: cardFeatures.color,
          elevation: cardFeatures.Elevation,
          child: InkWell(
            onTap: () {
              print('Tapped');
            },
            child: Container(
              height: cardFeatures.height,
              width: cardFeatures.widht,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: containerFeatures.widht,
                          height: containerFeatures.height,
                          decoration: BoxDecoration(
                            color: containerFeatures.checkColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Icon(Icons.check, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          language().tamamlananProjeler,
                          style: cardtitle1Style(),
                        ),
                        Text(language().aktifProjeler.length.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          color: cardFeatures.color,
          elevation: cardFeatures.Elevation,
          child: InkWell(
            onTap: () {
              print('Tapped');
            },
            child: Container(
              height: cardFeatures.height,
              width: cardFeatures.widht,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: containerFeatures.widht,
                          height: containerFeatures.height,
                          decoration: BoxDecoration(
                            color: containerFeatures.moneyColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Icon(Icons.currency_lira, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          language().bekleyenOdeme,
                          style: cardtitle1Style(),
                        ),
                        Text('₺'.toString() + calculatePayment().toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

TextStyle cardtitle1Style() {
  return TextStyle(
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
