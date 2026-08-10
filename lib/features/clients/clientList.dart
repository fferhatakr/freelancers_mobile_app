import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_style.dart';
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
            Text(language.musteriler, style: _appBarTitle()),
            Text(language.musterileriYonet, style: _appBarSubtitle()),
          ],
        ),

        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              AppNavigation.navigateTo(context, ClientAddScreen());
            },
            icon: _personAdd(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(GeneralStyle.paddingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _clientSearch(),
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

  TextField _clientSearch() {
    return TextField(
      autofocus: true,
      maxLength: GeneralStyle.textFieldMaxLenght,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_outlined),
        labelText: language.hizliArama,
        hintText: language.musteriAra,
        hintStyle: TextStyle(color: GeneralStyle.hintTextcolor),
      ),
    );
  }

  CircleAvatar _personAdd() {
    return CircleAvatar(
      backgroundColor: ClientsStyle.circleAvatarColor,
      child: Icon(Icons.person_add, color: ClientsStyle.personIconColor),
    );
  }

  TextStyle _appBarSubtitle() {
    return TextStyle(
      fontSize: GeneralStyle.appBarSubtitleSize,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle _appBarTitle() {
    return TextStyle(
      fontSize: GeneralStyle.appBarTitleSize,
      fontWeight: FontWeight.bold,
    );
  }
}
