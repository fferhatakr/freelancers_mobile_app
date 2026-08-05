import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/product/language.dart';
import 'package:freelancer_tracking_system/screen/dashboard.dart';

class fastTransactions extends StatelessWidget {
  const fastTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            language.hizliIslemler,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: AppSpacing.small),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Card(
                  elevation: FastTransactionsCard.elevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: cardBorderRadius(),
                  ),
                  child: Padding(
                    padding: cardPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: FastTransactionsCard.sizeContainer,
                              width: FastTransactionsCard.sizeContainer,
                              decoration: BoxDecoration(
                                color: FastTransactionsCard.billColor,
                                borderRadius: cardBorderRadius(),
                              ),
                              child: Icon(
                                Icons.receipt,
                                color: FastTransactionsCard.receiptIconColor,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  language.faturaOlustur,
                                  style: TextStyle(
                                    fontSize: FastTransactionsCard.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  language.yeniFaturaekle,
                                  style: TextStyle(
                                    fontSize:
                                        FastTransactionsCard.title2fontSize,
                                    color: FastTransactionsCard.title2Color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => dashboard(),
                                ),
                              );
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                color: Colors.purple[50],
                                borderRadius: cardBorderRadius(),
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 16,
                                color: Colors.purple[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: FastTransactionsCard.elevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: cardBorderRadius(),
                  ),
                  child: Padding(
                    padding: cardPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Icon(Icons.person_add),
                              height: FastTransactionsCard.sizeContainer,
                              width: FastTransactionsCard.sizeContainer,
                              decoration: BoxDecoration(
                                color: Colors.green[600],
                                borderRadius: cardBorderRadius(),
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  language.yeniMusteri,
                                  style: title1Style(),
                                ),
                                Text(
                                  language.musteriKaydiEkle,
                                  style: title2Style(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.medium),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                borderRadius: cardBorderRadius(),

                                color: Colors.green[50],
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.green[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Card(
                  elevation: FastTransactionsCard.elevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: cardBorderRadius(),
                  ),
                  child: Padding(
                    padding: cardPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: FastTransactionsCard.sizeContainer,
                              width: FastTransactionsCard.sizeContainer,
                              decoration: BoxDecoration(
                                borderRadius: cardBorderRadius(),
                                color: Colors.amber,
                              ),
                              child: Icon(
                                Icons.assignment_add,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language.projeEkle, style: title1Style()),
                                Text(
                                  language.yeniKazancSagla,
                                  style: title2Style(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.medium),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                borderRadius: cardBorderRadius(),
                                color: Colors.amber[50],
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.amber[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: FastTransactionsCard.elevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: cardBorderRadius(),
                  ),
                  child: Padding(
                    padding: cardPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: FastTransactionsCard.sizeContainer,
                              width: FastTransactionsCard.sizeContainer,
                              decoration: BoxDecoration(
                                borderRadius: cardBorderRadius(),
                                color: Colors.red[400],
                              ),
                              child: Icon(
                                Icons.task,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language.gorevEkle, style: title1Style()),
                                Text(
                                  language.projeniSaglamaAl,
                                  style: title2Style(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Colors.red[50],
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.red[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle title2Style() {
    return TextStyle(
      color: FastTransactionsCard.title2Color,
      fontSize: FastTransactionsCard.title2fontSize,
    );
  }

  TextStyle title1Style() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: FastTransactionsCard.fontSize,
    );
  }

  BorderRadius cardBorderRadius() => BorderRadius.circular(8);

  EdgeInsetsGeometry cardPadding() => EdgeInsetsGeometry.all(12);
}

class FastTransactionsCard {
  static double sizeContainer = 36;
  static Color? billColor = Colors.purple[600];
  static Color receiptIconColor = Colors.white;
  static double fontSize = 14;
  static double title2fontSize = 11;
  static Color? title2Color = Colors.grey;
  static double elevation = 3;
}

class AppSpacing {
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
}
