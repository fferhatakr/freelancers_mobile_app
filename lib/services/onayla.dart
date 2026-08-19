import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_colors.dart';
import 'package:freelancer_tracking_system/features/auth/pages/login_page.dart';
import 'package:freelancer_tracking_system/features/home/pages/home.dart';

class Onayla extends StatelessWidget {
  const Onayla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.white,
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        child: Icon(Icons.exit_to_app, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            SizedBox(height: 100),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: const Color.fromARGB(255, 104, 147, 168),
              ),
              child: Icon(
                size: 50,
                Icons.email_outlined,
                color: const Color.fromARGB(255, 17, 23, 34),
              ),
            ),
            Text(
              'E-postanı doğrula',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Gelen kutuna gönderdiğimiz linke\ntıklayarak hesabını aktif hale getir.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            InkWell(
              onTap: () async {
                try {
                  await FirebaseAuth.instance.currentUser?.reload();

                  if (FirebaseAuth.instance.currentUser?.emailVerified ==
                      true) {
                    AppNavigationReplace.navigateTo(context, Home());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Email Adresi Doğrulanmadı'),
                        backgroundColor: AppColors.danger,
                      ),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Bir şeyler ters gitti.'),
                      backgroundColor: AppColors.warning,
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black,
                ),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Colors.white),
                    Text(
                      'Onayladım',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                try {
                  await FirebaseAuth.instance.currentUser
                      ?.sendEmailVerification();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Mail gönderildi'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Çok fazla deneme yaptınız, biraz bekleyin',
                      ),
                      backgroundColor: AppColors.danger,
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.navigation_outlined, color: Colors.black),
                    Text(
                      'Linki Tekrar Gönder',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
