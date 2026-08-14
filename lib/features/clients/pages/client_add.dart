import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/clients/widgets/client_form_field.dart';

class ClientAddScreen extends StatefulWidget {
  const ClientAddScreen({super.key});
  @override
  State<ClientAddScreen> createState() => _ClientAddScreenState();
}

class _ClientAddScreenState extends State<ClientAddScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final telefonController = TextEditingController();
  final firmaController = TextEditingController();
  final notController = TextEditingController();
  final adresController = TextEditingController();
  final sourceController = TextEditingController();
  final commentController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    telefonController.dispose();
    firmaController.dispose();
    notController.dispose();
    adresController.dispose();
    sourceController.dispose();
    commentController.dispose();
    super.dispose();
  }

  final SnackBar _requiredfields = SnackBar(
    content: Text('Zorunlu Alanları Doldurunuz'),
  );
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
      Language.yeniMusteri,
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
          Language.musteriBilgileri,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),

        ClientFormField(
          icon: Icons.person_2_outlined,
          title: Language.adSoyad + '*',
          title2: Language.adSoyadAciklama,
          controlText: nameController,
        ),
        ClientFormField(
          icon: Icons.mail_outline,
          title: Language.eposta + '*',
          title2: Language.epostaAciklama,
          controlText: emailController,
        ),
        ClientFormField(
          icon: Icons.call,
          title: Language.telefon + '*',
          title2: Language.telefonAciklama,
          controlText: telefonController,
        ),
        ClientFormField(
          icon: Icons.home,
          title: Language.firmaAdi,
          title2: Language.firmaAdiAciklama,
          controlText: firmaController,
        ),

        Text(
          Language.adresTitle,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(
          height: 100,
          child: ClientFormField(
            icon: Icons.comment,
            title: 'Açıklama Ekle(Opsiyonel)',
            title2: Language.aciklamaEkle,
            controlText: adresController,
            height: 60,
          ),
        ),

        Text(
          Language.notlarTitle,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        ClientFormField(
          icon: Icons.note_add_outlined,
          title: Language.not,
          title2: Language.notAciklama,
          controlText: notController,
        ),
        Text(
          Language.kaynakTitle,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ClientFormField(
          icon: Icons.source,
          title: Language.kaynak,
          title2: Language.kaynakAciklama,
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
          adSoyad: nameController.text,
          email: emailController.text,
          telefon: telefonController.text,
          firma: firmaController.text,
          not: notController.text,
          source: sourceController.text,
          comment: commentController.text,
        );
        if (nameController.text.trim().isEmpty ||
            emailController.text.trim().isEmpty ||
            telefonController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(_requiredfields);
        } else {
          CustomerProvider().addCustomer(items: customer);
          Navigator.pop(context);
        }
      },

      child: Center(
        child: Text(
          Language.kaydet,
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
          Language.info,
          style: TextStyle(fontSize: ClientsStyle.infoFontSize),
        ),
      ),
    );
  }
}
