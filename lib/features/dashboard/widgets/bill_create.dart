import 'package:flutter/material.dart';

class BillsInfo extends StatelessWidget {
  final String title;
  final IconData prefixIcon;
  final String hintTitle;
  final double? widht;
  final double? height;

  const BillsInfo({
    required this.title,
    required this.prefixIcon,
    required this.hintTitle,
    this.widht,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w400)),
        SizedBox(
          height: height ?? 50,
          width: widht ?? 170,
          child: TextField(
            maxLength: 20,
            decoration: InputDecoration(
              counterText: '',
              prefixIcon: Icon(prefixIcon),
              hintText: hintTitle,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
