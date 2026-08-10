import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ePostaGir = TextEditingController();
  final sifreGir = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Giriş Yap',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Hesabınıza giriş yaparak devam edin',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'E-posta',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: ePostaGir,
                        decoration: InputDecoration(
                          hintText: 'E-posta adresinizi giriniz',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          prefixIcon: Icon(
                            Icons.mail_outline_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        'Şifre',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        obscureText: true, // Girdiği şifreyi yıldızlar!
                        controller: sifreGir,
                        decoration: InputDecoration(
                          hintText: 'Şifrenizi giriniz',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print('Şifremi Unuttum');
                        },
                        child: Text(
                          'Şifremi unuttum?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(sifreGir.text + ePostaGir.text);
                        },
                        child: Center(
                          child: Text(
                            'Giriş Yap',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'veya',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 5),
                      InkWell(
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
                                child: Icon(
                                  Icons.g_mobiledata,
                                  color: Colors.white,
                                ),
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
                      ),
                      SizedBox(height: 5),

                      InkWell(
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
                                child: Icon(
                                  Icons.apple_outlined,
                                  color: Colors.white,
                                ),
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
                      ),
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
                  onPressed: () {},
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
}
