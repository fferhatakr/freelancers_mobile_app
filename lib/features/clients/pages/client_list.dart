import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/clients/pages/client_add.dart';
import 'package:freelancer_tracking_system/features/clients/widgets/client_card.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:provider/provider.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    final customerItems = context.watch<CustomerProvider>().items;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Language.musteriler, style: _appBarTitle()),
            Text(Language.musterileriYonet, style: _appBarSubtitle()),
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
              child: InkWell(
                onTap: () {},
                child: ListView.builder(
                  itemCount: customerItems.length,
                  itemBuilder: (context, index) {
                    final customer = customerItems[index];
                    return ClientCard(
                      name: customer.adSoyad,
                      telefon: customer.telefon,
                      email: customer.email,
                    );
                  },
                ),
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
        labelText: Language.hizliArama,
        hintText: Language.musteriAra,
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
