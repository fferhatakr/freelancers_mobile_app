import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/widget/fastTransactions.dart';

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
          color: const Color.fromARGB(255, 0, 27, 49),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: containerColor,
                      ),
                      child: Icon(icon, color: containerIconColor),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title1, style: _title1Style()),
                        Text(title2, style: _title2Style()),
                        Text(title3, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: containerTwoColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 24,
                        width: 24,
                        child: GestureDetector(
                          onTap: () {
                            print('object');
                          },
                          child: Icon(Icons.chevron_right, color: Colors.white),
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

class ActiveProject extends StatelessWidget {
  const ActiveProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Aktif Projeler',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        _ActiveProjects(
          containerColor: containerGoldColor(),
          containerIconColor: containerIConGoldColor(),
          icon: Icons.add_shopping_cart_rounded,
          title1: 'E-Ticaret Sitesi',
          title2: 'İnteraktif',
          title3: 'title3',
          containerTwoColor: containerGoldColor(),
        ),
        _ActiveProjects(
          containerColor: containerBlueColor(),
          containerIconColor: containerIconBlueColor(),
          icon: Icons.phone_android_rounded,
          title1: 'Mobile Uygulama',
          title2: 'Mobile App',
          title3: 'Bar',
          containerTwoColor: containerBlueColor(),
        ),
        _ActiveProjects(
          containerColor: containerGoldColor(),
          containerIconColor: containerIConGoldColor(),
          icon: Icons.admin_panel_settings_outlined,
          title1: 'Yönetim Paneli',
          title2: 'Dashboard',
          title3: 'Bar',
          containerTwoColor: containerGoldColor(),
        ),
        _ActiveProjects(
          containerColor: containerBlueColor(),
          containerIconColor: containerIconBlueColor(),
          icon: Icons.language_outlined,
          title1: 'Kurumsal Website',
          title2: 'Web Tasarim',
          title3: 'Bar',
          containerTwoColor: containerBlueColor(),
        ),
      ],
    );
  }

  Color containerIconBlueColor() => const Color.fromARGB(255, 135, 76, 255);

  Color containerBlueColor() => const Color.fromARGB(255, 29, 51, 100);

  Color containerIConGoldColor() => Color.fromARGB(255, 248, 197, 101);

  Color containerGoldColor() => Color.fromARGB(255, 124, 87, 8);
}

TextStyle _title1Style() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FastTransactionsCard.fontSize,
    color: Colors.white,
  );
}

TextStyle _title2Style() {
  return TextStyle(
    color: Colors.white,
    fontSize: FastTransactionsCard.title2fontSize,
  );
}
