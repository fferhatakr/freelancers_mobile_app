import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/clients/clients_add_screen.dart';
import 'package:freelancer_tracking_system/features/clients/widgets/clientWidget.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

List<Map<String, String>> dummyClient = [
  {'name': 'Ferhat', 'surname': 'Akar', 'email': 'Ferhat@gmail.com'},
  {'name': 'Nisa', 'surname': 'Sevgi', 'email': 'Sevgi@gmail.com'},
  {'name': 'Ahmet', 'surname': 'Dag', 'email': 'Ahmet@gmail.com'},
  {'name': 'Mehmet', 'surname': 'Coban', 'email': 'Mehmet@gmail.com'},
  {'name': 'Deniz', 'surname': 'Akar', 'email': 'Deniz@gmail.com'},
  {'name': 'Fatma', 'surname': 'Boy', 'email': 'Boy@gmail.com'},
  {'name': 'Dervis', 'surname': 'Gol', 'email': 'Gol@gmail.com'},
];

class _ClientListPageState extends State<ClientListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              language.musteriler,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              language.musterileriYonet,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),

        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              AppNavigation.navigateTo(context, ClientAddScreen());
            },
            icon: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: AppColors.clientListDecoration,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(
                Icons.person_add_alt_1_outlined,
                color: AppColors.personIconColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                labelText: language.hizliArama,
                hintText: language.musteriAra,
                hintStyle: TextStyle(color: AppColors.hintTextColor),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dummyClient.length,
                itemBuilder: (context, index) {
                  return ClientList(
                    name: dummyClient[index]['name']!,
                    surname: dummyClient[index]['surname']!,
                    email: dummyClient[index]['email']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
