import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/features/customer/widgets/client_form_field.dart';

class CustomerAddScreen extends StatefulWidget {
  const CustomerAddScreen({super.key});
  @override
  State<CustomerAddScreen> createState() => _CustomerAddScreenState();
}

class _CustomerAddScreenState extends State<CustomerAddScreen> {
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
        backgroundColor: AppColors.green,
        title: _clientAddAppBarTitle(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: _paddingSizeTen(),
          child: _clientAddCards(context),
        ),
      ),
    );
  }

  EdgeInsets _paddingSizeTen() => EdgeInsets.all(AppPadding.p10);

  Text _clientAddAppBarTitle() {
    return Text(
      CustomerStrings.yeniMusteri,
      style: TextStyle(
        fontSize: AppSizes.size12,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Column _clientAddCards(BuildContext context) {
    return Column(
      spacing: AppSpacing.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          CustomerStrings.musteriBilgileri,
          style: TextStyle(
            fontSize: AppSizes.size16,
            fontWeight: FontWeight.bold,
          ),
        ),

        ClientFormField(
          icon: Icons.person_2_outlined,
          title: CustomerStrings.adSoyad,
          title2: CustomerStrings.adSoyadAciklama,
          controlText: nameController,
        ),
        ClientFormField(
          icon: Icons.mail_outline,
          title: CustomerStrings.eposta,
          title2: CustomerStrings.epostaAciklama,
          controlText: emailController,
        ),
        ClientFormField(
          icon: Icons.call,
          title: CustomerStrings.telefon,
          title2: CustomerStrings.telefonAciklama,
          controlText: telefonController,
        ),
        ClientFormField(
          icon: Icons.home,
          title: CustomerStrings.firmaAdi,
          title2: CustomerStrings.firmaAdiAciklama,
          controlText: firmaController,
        ),

        Text(
          CustomerStrings.adresTitle,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(
          height: AppSizes.size96,
          child: ClientFormField(
            icon: Icons.comment,
            title: CustomerStrings.opsiyonelAciklama,
            title2: CustomerStrings.aciklamaEkle,
            controlText: adresController,
            height: AppSizes.size64,
          ),
        ),

        Text(
          CustomerStrings.notlarTitle,
          style: TextStyle(
            fontSize: GeneralStyle.columnMiniTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        ClientFormField(
          icon: Icons.note_add_outlined,
          title: CustomerStrings.not,
          title2: CustomerStrings.notAciklama,
          controlText: notController,
        ),
        Text(
          CustomerStrings.kaynakTitle,
          style: TextStyle(
            fontSize: AppSizes.size16,
            fontWeight: FontWeight.bold,
          ),
        ),
        ClientFormField(
          icon: Icons.source,
          title: CustomerStrings.kaynak,
          title2: CustomerStrings.kaynakAciklama,
          controlText: sourceController,
        ),
        _Info(),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
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
          CommonStrings.kaydet,
          style: TextStyle(color: AppColors.greenDark),
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
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
        color: AppColors.greenPale,
      ),
      child: ListTile(
        leading: Icon(Icons.info_outline, color: AppColors.greenDark),
        title: Text(
          CommonStrings.info,
          style: TextStyle(fontSize: AppSizes.size16),
        ),
      ),
    );
  }
}
