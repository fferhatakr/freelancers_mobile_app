import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';

class LabeledTextField extends StatelessWidget {
  final String miniTitle;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final double fontSize = 16;
  final double hintSize = 14;
  const LabeledTextField({
    required this.miniTitle,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(GeneralStyle.paddingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: GeneralStyle.spacingTextField,
        children: [
          Text(miniTitle, style: _textStyle()),
          TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: hintSize, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle() =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize);
}
