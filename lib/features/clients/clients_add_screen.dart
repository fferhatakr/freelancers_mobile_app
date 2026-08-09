import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/clients/widgets/clients_add_widget.dart';

class ClientAddScreen extends StatelessWidget {
  final adSoyadController = TextEditingController();
  final emailController = TextEditingController();
  final telefonController = TextEditingController();
  final firmaController = TextEditingController();
  final notController = TextEditingController();
  final adresController = TextEditingController();
  final sourceController = TextEditingController();
  final aciklamaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yeni Müşteri',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  print('object');
                  print(adSoyadController.text);
                },
                child: Row(
                  children: [
                    Icon(Icons.check, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Kaydet', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Müşteri Bilgileri',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              ClientAdd(
                icon: Icons.person_2_outlined,
                title: 'Ad Soyad',
                title2: 'Müşteri adı soyadı',
                controlText: adSoyadController,
              ),
              ClientAdd(
                icon: Icons.mail_outline,
                title: 'E-posta',
                title2: 'ornek@mail.com',
                controlText: emailController,
              ),
              ClientAdd(
                icon: Icons.call,
                title: 'Telefon',
                title2: '5XX XXX XX XX',
                controlText: telefonController,
              ),
              ClientAdd(
                icon: Icons.home,
                title: 'Firma Adı',
                title2: 'Firma adı(opsiyonel)',
                controlText: firmaController,
              ),
              ClientAdd(
                icon: Icons.comment,
                title: 'Açıklama',
                title2: 'Not ekleyin(opsiyonel)',
                controlText: aciklamaController,
              ),
              Text(
                'Adres Bilgileri',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              ClientAdd(
                icon: Icons.navigation_outlined,
                title: 'Adres',
                title2: 'Adres Bilgileri(opsiyonel)',
                controlText: adresController,
              ),

              Text(
                'Notlar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ClientAdd(
                icon: Icons.note_add_outlined,
                title: 'Not Ekle',
                title2: 'Müşterin ile ilgili not ekle(opsiyonel)',
                controlText: notController,
              ),
              Text(
                'Müşteri Kaynağı',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ClientAdd(
                icon: Icons.source,
                title: 'Kaynak',
                title2: 'Müşterini Nereden Buldun(opsiyonel)',
                controlText: sourceController,
              ),
              _info(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _info extends StatelessWidget {
  const _info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color.fromARGB(255, 223, 249, 224),
      ),
      child: ListTile(
        leading: Icon(Icons.info_outline, color: Colors.green[800]),
        title: Text(
          'Kaydedildiginde müşteri listenizde görünecektir',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
