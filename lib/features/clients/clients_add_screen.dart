import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
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
        backgroundColor: ClientsStyle.appBarBackground,
        title: _clientAddAppBarTitle(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GeneralStyle.paddingSize),
          child: _clientAddCards(),
        ),
      ),
    );
  }

  Text _clientAddAppBarTitle() {
    return Text(
      language.yeniMusteri,
      style: TextStyle(
        fontSize: GeneralStyle.appBarTitleSize,
        color: GeneralStyle.appBarTitle,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Column _clientAddCards() {
    return Column(
      spacing: GeneralStyle.columnSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          language.musteriBilgileri,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),

        ClientAdd(
          icon: Icons.person_2_outlined,
          title: language.adSoyad,
          title2: language.adSoyadAciklama,
          controlText: adSoyadController,
        ),
        ClientAdd(
          icon: Icons.mail_outline,
          title: language.eposta,
          title2: language.epostaAciklama,
          controlText: emailController,
        ),
        ClientAdd(
          icon: Icons.call,
          title: language.telefon,
          title2: language.telefonAciklama,
          controlText: telefonController,
        ),
        ClientAdd(
          icon: Icons.home,
          title: language.firmaAdi,
          title2: language.firmaAdiAciklama,
          controlText: firmaController,
        ),
        ClientAdd(
          icon: Icons.comment,
          title: language.aciklama,
          title2: language.aciklamaEkle,
          controlText: aciklamaController,
        ),
        Text(
          language.adresTitle,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),

        ClientAdd(
          icon: Icons.navigation_outlined,
          title: language.aciklama,
          title2: language.aciklamaEkle,
          controlText: adresController,
        ),

        Text(
          language.notlarTitle,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        ClientAdd(
          icon: Icons.note_add_outlined,
          title: language.not,
          title2: language.notAciklama,
          controlText: notController,
        ),
        Text(
          language.kaynakTitle,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ClientAdd(
          icon: Icons.source,
          title: language.kaynak,
          title2: language.kaynakAciklama,
          controlText: sourceController,
        ),
        _Info(),
        Padding(
          padding: const EdgeInsets.all(GeneralStyle.paddingSize),
          child: _elevatedButton(),
        ),
      ],
    );
  }

  ElevatedButton _elevatedButton() {
    return ElevatedButton(
      onPressed: () {
        print('Saved');
      },
      child: Center(
        child: Text(
          language.kaydet,
          style: TextStyle(color: ClientsStyle.addIconColor),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ClientsStyle.infoHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(GeneralStyle.paddingSize),
        ),
        color: ClientsStyle.infoBackground,
      ),
      child: ListTile(
        leading: Icon(Icons.info_outline, color: ClientsStyle.infoIconColor),
        title: Text(
          language.info,
          style: TextStyle(fontSize: ClientsStyle.infoFontSize),
        ),
      ),
    );
  }
}
