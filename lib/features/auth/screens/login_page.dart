import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/features/auth/screens/auth_widgets.dart';
import 'package:freelancer_tracking_system/features/auth/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueGrey[300],
                ),
                child: Icon(Icons.computer, color: Colors.white, size: 30),
              ),
            ),
            Text(
              'Freelio',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              'Projelerinizi yönetin, zamanınızı kazanın',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blueGrey[100],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabeledTextField(
                        controller: _emailController,
                        miniTitle: 'E-posta',
                        hintText: 'Lütfen e-posta giriniz',
                        prefixIcon: Icons.mail_outline,
                      ),

                      LabeledTextField(
                        obscureText: true,
                        controller: _passwordController,
                        miniTitle: 'Şifre',
                        hintText: 'Şifrenizi Giriniz',
                        prefixIcon: Icons.lock_outline,
                      ),
                      _sifremiUnuttum(),
                      _girisYap(),
                      Center(
                        child: Text(
                          'veya',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      _withLoginGoogle(),

                      _withLoginApple(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hesabınız Yok mu?'),
                TextButton(
                  onPressed: () {
                    AppNavigation.navigateTo(context, RegisterPage());
                  },
                  child: Text(
                    'Kayıt Olun',
                    style: TextStyle(
                      color: Colors.black,

                      fontWeight: FontWeight.bold,
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

  InkWell _withLoginApple() {
    return InkWell(
      onTap: () {
        print('object');
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[300],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: Icon(Icons.apple_outlined, color: Colors.white),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Apple ile giriş yap.',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  InkWell _withLoginGoogle() {
    return InkWell(
      onTap: () {
        print('object');
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[300],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: Icon(Icons.g_mobiledata, color: Colors.white),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Google ile giriş yap.',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  ElevatedButton _girisYap() {
    return ElevatedButton(
      onPressed: () async {
        print('Giriş Yapıldı');
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      },
      child: Center(
        child: Text('Giriş Yap', style: TextStyle(color: Colors.black)),
      ),
    );
  }

  TextButton _sifremiUnuttum() {
    return TextButton(
      onPressed: () {
        print('Şifremi Unuttum');
      },
      child: Text('Şifremi unuttum?', style: TextStyle(color: Colors.black)),
    );
  }
}
