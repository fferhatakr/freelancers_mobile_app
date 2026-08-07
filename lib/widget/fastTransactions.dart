import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/product/language.dart';

class _FastCard extends StatelessWidget {
  final Color iconContainerColorOne;
  final IconData iconOne;
  final String title1;
  final String title2;
  final Color iconContainerColorTwo;

  final Color iconTwoColor;

  const _FastCard({
    required this.iconContainerColorOne,
    required this.iconOne,
    required this.title1,
    required this.title2,
    required this.iconContainerColorTwo,

    required this.iconTwoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: FastTransactionsCard.elevation,
        shape: RoundedRectangleBorder(borderRadius: cardBorderRadius()),
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
                      color: iconContainerColorOne,
                    ),
                    child: Icon(iconOne, color: Colors.white, size: 18),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title1, style: title1Style()),
                      Text(title2, style: title2Style()),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    print('object');
                  },
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: iconContainerColorTwo,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: iconTwoColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BorderRadius cardBorderRadius() => BorderRadius.circular(8);

EdgeInsetsGeometry cardPadding() => EdgeInsetsGeometry.all(12);

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
              _FastCard(
                iconContainerColorOne: Colors.purple,
                iconOne: Icons.task,
                title1: language.faturaOlustur,
                title2: language.yeniFaturaekle,
                iconContainerColorTwo: Color.fromARGB(255, 240, 153, 255),
                iconTwoColor: Colors.purple,
              ),
              _FastCard(
                iconContainerColorOne: Colors.green,
                iconOne: Icons.person_add,
                title1: language.yeniMusteri,
                title2: language.musteriKaydiEkle,
                iconContainerColorTwo: const Color.fromARGB(255, 196, 249, 198),
                iconTwoColor: Colors.green,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _FastCard(
                iconContainerColorOne: Colors.amber,
                iconOne: Icons.assignment_add,
                title1: language.projeEkle,
                title2: language.yeniKazancSagla,
                iconContainerColorTwo: const Color.fromARGB(255, 255, 245, 213),
                iconTwoColor: const Color.fromARGB(255, 255, 188, 4),
              ),
              _FastCard(
                iconContainerColorOne: const Color.fromARGB(255, 255, 53, 39),
                iconOne: Icons.add_task,
                title1: language.gorevEkle,
                title2: language.projeniSaglamaAl,
                iconContainerColorTwo: const Color.fromARGB(255, 255, 195, 190),
                iconTwoColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
