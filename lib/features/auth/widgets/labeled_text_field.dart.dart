import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/app_all_style.dart';

class LabeledTextField extends StatelessWidget {
  final String miniTitle;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final double fontSize = 16;
  final double hintSize = 14;
  final int maxLength;

  const LabeledTextField({
    required this.miniTitle,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
    super.key,
    this.maxLength = 20,
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
            maxLength: 20,
            controller: controller,
            obscureText: obscureText,

            decoration: InputDecoration(
              counterText: '',
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

class PasswordTextField extends StatefulWidget {
  final String miniTitle;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final IconData suffixIconOff;
  final IconData suffixIconOn;
  final int maxLength;

  const PasswordTextField({
    required this.miniTitle,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIconOff,
    required this.suffixIconOn,
    this.maxLength = 20,
    this.obscureText = false,
    this.controller,
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final double fontSize = 16;

  final double hintSize = 14;
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(GeneralStyle.paddingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: GeneralStyle.spacingTextField,
        children: [
          Text(widget.miniTitle, style: _textStyle()),
          TextField(
            maxLength: widget.maxLength,
            controller: widget.controller,
            obscureText: _isSecure,
            decoration: InputDecoration(
              counterText: '',
              prefixIcon: Icon(widget.prefixIcon),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: hintSize, color: Colors.black),
              suffixIcon: IconButton(
                onPressed: () {
                  _changeLoading();
                },
                icon: AnimatedCrossFade(
                  firstChild: Icon(widget.suffixIconOff),
                  secondChild: Icon(widget.suffixIconOn),
                  crossFadeState: _isSecure
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(seconds: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle() =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize);
}
