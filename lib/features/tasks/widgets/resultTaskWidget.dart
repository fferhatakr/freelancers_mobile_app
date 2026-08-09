import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';

class ResultTask extends StatelessWidget {
  ResultTask({super.key});

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        elevation: 10,
        color: AppColors.activeProjectCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('12', style: _textStyle()),
                  Text('Toplam Görev', style: _twoTextStyle()),
                ],
              ),
              Column(
                children: [
                  Text('8', style: _textStyle()),
                  Text('Tamamlandı', style: _twoTextStyle()),
                ],
              ),
              Column(
                children: [
                  Text('4', style: _textStyle()),
                  Text('Devam Ediyor', style: _twoTextStyle()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _twoTextStyle() => TextStyle(fontSize: 16, color: Colors.grey);

  TextStyle _textStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(255, 255, 248, 248),
    );
  }
}
