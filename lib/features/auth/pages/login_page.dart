import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/themes/app_all_style.dart';
import 'package:freelancer_tracking_system/features/auth/widgets/labeled_text_field.dart.dart';
import 'package:freelancer_tracking_system/features/auth/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelancer_tracking_system/features/home/pages/home.dart';
import 'package:freelancer_tracking_system/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthServices _authService = AuthServices();

  final _wrongPassword = SnackBar(content: Text('Şifre yanlış.'));
  final _userOrPasswordWrong = SnackBar(
    content: Text('Kullanıcı adı veya şifre yanlış.'),
  );
  final _girisYapilamadi = SnackBar(content: Text('Giriş Başarısız.'));
  final _notFoundUser = SnackBar(content: Text('Böyle bir kullanıcı yok'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(GeneralStyle.paddingSize),
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

                      PasswordTextField(
                        controller: _passwordController,
                        miniTitle: 'Şifre',
                        hintText: 'Şifrenizi Giriniz',
                        prefixIcon: Icons.lock,
                        suffixIconOff: Icons.visibility_off_outlined,
                        suffixIconOn: Icons.visibility_outlined,
                      ),
                      _forgetPassword(),
                      _login(),
                      Center(
                        child: Text(
                          'veya',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      _withLoginGoogle(),
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

  InkWell _withLoginGoogle() {
    return InkWell(
      onTap: () async {
        try {
          UserCredential userCredential = await AuthServices()
              .signInWithGoogle();
          AppNavigationReplace.navigateTo(context, Home());
        } catch (e) {
          print(e);
          ScaffoldMessenger.of(context).showSnackBar(_girisYapilamadi);
        }
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

  ElevatedButton _login() {
    return ElevatedButton(
      onPressed: () async {
        try {
          await _authService.login(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
        } on FirebaseAuthException catch (e) {
          if (!mounted) return;
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(_notFoundUser);
          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context).showSnackBar(_wrongPassword);
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(_userOrPasswordWrong);
          }
        }
      },
      child: Center(
        child: Text('Giriş Yap', style: TextStyle(color: Colors.black)),
      ),
    );
  }

  TextButton _forgetPassword() {
    return TextButton(
      onPressed: () {},
      child: Text('Şifremi unuttum?', style: TextStyle(color: Colors.black)),
    );
  }
}
