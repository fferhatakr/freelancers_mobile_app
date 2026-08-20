import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/app_all_style.dart';
import 'package:freelancer_tracking_system/features/auth/widgets/labeled_text_field.dart.dart';
import 'package:freelancer_tracking_system/services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final AuthServices _authServices = AuthServices();
  final _weakPassword = SnackBar(content: Text('Şifre çok zayıf'));
  final _emailAlredyUse = SnackBar(content: Text('Email kullanılmaktadır'));
  final _noMatchPassword = SnackBar(content: Text('Şifreler uyuşmuyor'));
  final _noLength8 = SnackBar(content: Text('Şifreniz çok kısa.'));
  final _nameRequired = SnackBar(content: Text('Isim alanı boş geçilmez'));
  final _emailRequired = SnackBar(content: Text('Email alanı boş geçilmez'));
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
            PasswordTextField(
              controller: _password,
              miniTitle: 'Şifre',
              hintText: 'Şifrenizi Oluşturun',
              prefixIcon: Icons.lock_outline,
              suffixIconOff: Icons.visibility_off_outlined,
              suffixIconOn: Icons.visibility_outlined,
            ),
            PasswordTextField(
              controller: _confirmPassword,
              miniTitle: 'Şifre(Tekrar)',
              hintText: 'Şifrenizi Tekrar Girin',
              prefixIcon: Icons.lock,
              suffixIconOff: Icons.visibility_off_outlined,
              suffixIconOn: Icons.visibility_outlined,
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
              padding: const EdgeInsets.all(GeneralStyle.paddingSize),
              child: InkWell(
                onTap: () async {
                  try {
                    await _authServices.register(
                      name: name.text.trim(),
                      email: _email.text.trim(),
                      password: _password.text.trim(),
                      confirmPassword: _confirmPassword.text.trim(),
                    );

                    if (!context.mounted) return;

                    Navigator.popUntil(context, ModalRoute.withName("/"));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(_weakPassword);
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(_emailAlredyUse);
                    }
                  } catch (e) {
                    final error = e.toString();
                    if (error.contains('password-mismatch')) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(_noMatchPassword);
                    } else if (error.contains('password-too-short')) {
                      ScaffoldMessenger.of(context).showSnackBar(_noLength8);
                    } else if (error.contains('name-required')) {
                      ScaffoldMessenger.of(context).showSnackBar(_nameRequired);
                    } else if (error.contains('email-required')) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(_emailRequired);
                    }
                    print(e);
                  }
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
