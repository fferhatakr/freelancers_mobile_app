import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  final String _title = "Freelancer Tracking System";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.chevron_left)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.back_hand_outlined)),
        ],
      ),
    );
  }
}
