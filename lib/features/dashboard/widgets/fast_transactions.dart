import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_add.dart';
import 'package:freelancer_tracking_system/features/dashboard/pages/bill_create.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_add.dart';
import 'package:freelancer_tracking_system/features/tasks/page/task_add.dart';

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
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: GeneralStyle.rowSpacing,
                children: [
                  SizedBox(
                    width: 35,
                    child: Container(
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
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title1, style: title1Style()),
                        Text(title2, style: title2Style()),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 50,
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
      ),
    );
  }
}

class FastTransactions extends StatefulWidget {
  const FastTransactions({super.key});

  @override
  State<FastTransactions> createState() => _FastTransactionsState();
}

class _FastTransactionsState extends State<FastTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DashboardStrings.hizliIslemler,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        _FastCard(
          iconContainerColorOne: FastTransactionsCardStyle.faturaContainerColor,
          iconOne: Icons.task,
          title1: InvoiceStrings.faturaOlustur,
          title2: InvoiceStrings.yeniFaturaekle,
          iconContainerColorTwo:
              FastTransactionsCardStyle.faturaIconContainerColor,
          iconTwoColor: FastTransactionsCardStyle.faturaContainerColor,
          onTap: () {
            AppNavigation.navigateTo(context, BillCreate());
          },
        ),
        _FastCard(
          iconContainerColorOne:
              FastTransactionsCardStyle.yeniMusteriContainerColor,
          iconOne: Icons.person_add,
          title1: CustomerStrings.yeniMusteri,
          title2: CustomerStrings.musteriKaydiEkle,
          iconContainerColorTwo: FastTransactionsCardStyle.yeniMusteriIconColor,
          iconTwoColor: FastTransactionsCardStyle.yeniMusteriContainerColor,
          onTap: () {
            AppNavigation.navigateTo(context, CustomerAddScreen());
          },
        ),
        _FastCard(
          iconContainerColorOne: FastTransactionsCardStyle.projeContainerColor,
          iconOne: Icons.assignment_add,
          title1: ProjectStrings.projeEkle,
          title2: ProjectStrings.yeniKazancSagla,
          iconContainerColorTwo: FastTransactionsCardStyle.projeIconColor,
          iconTwoColor: FastTransactionsCardStyle.projeContainerColor,
          onTap: () {
            AppNavigation.navigateTo(context, ProjectAdd());
          },
        ),
        _FastCard(
          iconContainerColorOne: FastTransactionsCardStyle.gorevContainerColor,
          iconOne: Icons.add_task,
          title1: ProjectStrings.gorevEkle,
          title2: ProjectStrings.projeniSaglamaAl,
          iconContainerColorTwo: FastTransactionsCardStyle.gorevIconColor,
          iconTwoColor: FastTransactionsCardStyle.gorevContainerColor,
          onTap: () {
            AppNavigation.navigateTo(context, TasksAdd());
          },
        ),
      ],
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
