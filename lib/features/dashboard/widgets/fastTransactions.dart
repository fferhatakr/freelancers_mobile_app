import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/clients/clients_add_screen.dart';
import 'package:freelancer_tracking_system/features/projects/projectAddScreen.dart';
import 'package:freelancer_tracking_system/features/tasks/tasksAddPage.dart';

class _FastCard extends StatelessWidget {
  final Color iconContainerColorOne;
  final IconData iconOne;
  final String title1;
  final String title2;
  final Color iconContainerColorTwo;
  final VoidCallback onTap;
  final Color iconTwoColor;

  const _FastCard({
    required this.iconContainerColorOne,
    required this.iconOne,
    required this.title1,
    required this.title2,
    required this.iconContainerColorTwo,
    required this.iconTwoColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ActiveProjectStyle.activeProjectCardColor,
      elevation: GeneralStyle.elevation,
      shape: RoundedRectangleBorder(borderRadius: cardBorderRadius()),
      child: Padding(
        padding: cardPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: GeneralStyle.rowSpacing,
              children: [
                Container(
                  height: FastTransactionsCardStyle.sizeContainer,
                  width: FastTransactionsCardStyle.sizeContainer,
                  decoration: BoxDecoration(
                    borderRadius: cardBorderRadius(),
                    color: iconContainerColorOne,
                  ),
                  child: Icon(
                    iconOne,
                    color: FastTransactionsCardStyle.iconColor,
                    size: FastTransactionsCardStyle.iconSize,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title1, style: title1Style()),
                    Text(title2, style: title2Style()),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                    width: FastTransactionsCardStyle.iconSizeContainer,
                    height: FastTransactionsCardStyle.iconSizeContainer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(GeneralStyle.borderRadius),
                      ),
                      color: iconContainerColorTwo,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: FastTransactionsCardStyle.iconChevronSize,
                      color: iconTwoColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class fastTransactions extends StatefulWidget {
  fastTransactions({Key? key}) : super(key: key);

  @override
  State<fastTransactions> createState() => _fastTransactionsState();
}

class _fastTransactionsState extends State<fastTransactions> {
  late final List<_FastCard> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      _FastCard(
        iconContainerColorOne: FastTransactionsCardStyle.faturaContainerColor,
        iconOne: Icons.task,
        title1: language.faturaOlustur,
        title2: language.yeniFaturaekle,
        iconContainerColorTwo:
            FastTransactionsCardStyle.faturaIconContainerColor,
        iconTwoColor: FastTransactionsCardStyle.faturaContainerColor,
        onTap: () {
          AppNavigation.navigateTo(context, ClientAddScreen());
        },
      ),
      _FastCard(
        iconContainerColorOne:
            FastTransactionsCardStyle.yeniMusteriContainerColor,
        iconOne: Icons.person_add,
        title1: language.yeniMusteri,
        title2: language.musteriKaydiEkle,
        iconContainerColorTwo: FastTransactionsCardStyle.yeniMusteriIconColor,
        iconTwoColor: FastTransactionsCardStyle.yeniMusteriContainerColor,
        onTap: () {
          AppNavigation.navigateTo(context, ClientAddScreen());
        },
      ),
      _FastCard(
        iconContainerColorOne: FastTransactionsCardStyle.projeContainerColor,
        iconOne: Icons.assignment_add,
        title1: language.projeEkle,
        title2: language.yeniKazancSagla,
        iconContainerColorTwo: FastTransactionsCardStyle.projeIconColor,
        iconTwoColor: FastTransactionsCardStyle.projeContainerColor,
        onTap: () {
          AppNavigation.navigateTo(context, ProjectAddPage());
        },
      ),
      _FastCard(
        iconContainerColorOne: FastTransactionsCardStyle.gorevContainerColor,
        iconOne: Icons.add_task,
        title1: language.gorevEkle,
        title2: language.projeniSaglamaAl,
        iconContainerColorTwo: FastTransactionsCardStyle.gorevIconColor,
        iconTwoColor: FastTransactionsCardStyle.gorevContainerColor,
        onTap: () {
          AppNavigation.navigateTo(context, TasksAddPage());
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(GeneralStyle.paddingSize),
      child: Column(
        spacing: GeneralStyle.columnSpacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            language.hizliIslemler,
            style: TextStyle(
              fontSize: GeneralStyle.columnMiniTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: FastTransactionsCardStyle.sizedBoxHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return _items[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}

BorderRadius cardBorderRadius() =>
    BorderRadius.circular(GeneralStyle.borderRadius);

EdgeInsetsGeometry cardPadding() =>
    EdgeInsetsGeometry.all(GeneralStyle.paddingSize);

TextStyle title2Style() {
  return TextStyle(
    color: FastTransactionsCardStyle.title2Color,
    fontSize: FastTransactionsCardStyle.title2fontSize,
  );
}

TextStyle title1Style() {
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: FastTransactionsCardStyle.fontSize,
  );
}
