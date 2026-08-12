import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/provider/client_provider.dart';
import 'package:provider/provider.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/clients/widgets/clients_add_widget.dart';

class ClientAddScreen extends StatefulWidget {
  @override
  State<ClientAddScreen> createState() => _ClientAddScreenState();
}

class _ClientAddScreenState extends State<ClientAddScreen> {
  final adSoyadController = TextEditingController();
  final emailController = TextEditingController();
  final telefonController = TextEditingController();
  final firmaController = TextEditingController();
  final notController = TextEditingController();
  final adresController = TextEditingController();
  final sourceController = TextEditingController();
  final aciklamaController = TextEditingController();
  @override
  void dispose() {
    adSoyadController.dispose();
    emailController.dispose();
    telefonController.dispose();
    firmaController.dispose();
    notController.dispose();
    adresController.dispose();
    sourceController.dispose();
    aciklamaController.dispose();
    super.dispose();
  }

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
          child: _clientAddCards(context),
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

  Column _clientAddCards(BuildContext context) {
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
          child: _elevatedButton(context),
        ),
      ],
    );
  }

  ElevatedButton _elevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final customer = Customer(
          adSoyad: adSoyadController.text,
          email: emailController.text,
          telefon: telefonController.text,
        );

        context.read<CustomerProvider>().addCustomer(customer);
        print('Kaydettik');
        Navigator.pop(context);
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
