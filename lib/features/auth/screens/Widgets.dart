import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String miniTitle;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const LabeledTextField({
    required this.miniTitle,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            miniTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
