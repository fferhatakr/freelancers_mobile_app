import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bize Ulaşın'),
        actions: [
          Text('Website'),
          IconButton(
            onPressed: () {
              launchURL('x');
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mesajını gönder,genelde 24 içinde dönüş yaparız.'),

              SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(hintText: 'Ne Olduğunu Anlat'),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Mesajı Gönder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

mixin LaunchMixin {
  final Uri _url = Uri.parse('https://lumeonlimited.com');

  Future launchURL(String url) async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }
}
