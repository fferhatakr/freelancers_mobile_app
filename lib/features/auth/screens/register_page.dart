import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/features/auth/screens/LabeledTextField._widgets.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  final name = TextEditingController();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _againPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kayıt Ol',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Yeni bir hesap oluşturarak başlayın.',
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 67, 67, 67),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LabeledTextField(
              controller: name,
              miniTitle: 'Ad Soyad',
              hintText: 'Adınız Soyadınız',
              prefixIcon: Icons.person_2_outlined,
            ),
            LabeledTextField(
              controller: _email,
              miniTitle: 'E-posta',
              hintText: 'E-posta adresiniz',
              prefixIcon: Icons.mail_outline,
            ),
            LabeledTextField(
              controller: _password,
              obscureText: true,
              miniTitle: 'Şifre',
              hintText: 'Şifrenizi Oluşturun',
              prefixIcon: Icons.lock_outline,
            ),
            LabeledTextField(
              controller: _againPassword,
              obscureText: true,
              miniTitle: 'Şifre(Tekrar)',
              hintText: 'Şifrenizi Tekrar Girin',
              prefixIcon: Icons.lock_outline,
            ),
            Padding(
              padding: const EdgeInsets.all(GeneralStyle.paddingSize),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(GeneralStyle.borderRadius),
                  ),
                  color: Colors.black,
                ),
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(GeneralStyle.paddingSize),
                  child: Row(
                    spacing: GeneralStyle.rowSpacing,
                    children: [
                      Icon(Icons.security, color: Colors.white, size: 40),
                      Flexible(
                        child: Text(
                          maxLines: 3,
                          'Şifreniz en az 8 karakter olmalı ve büyük harf,küçük harf,rakam ve özel karekter içermelidir.',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 191, 191, 191),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  print('Giriş Yapıldı');
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: _email.text.trim(),
                          password: _password.text.trim(),
                        );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                  Navigator.popUntil(context, ModalRoute.withName("/"));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(GeneralStyle.borderRadius),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
