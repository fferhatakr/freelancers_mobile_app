import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/features/clients/pages/client_add.dart';

class BillCreate extends StatelessWidget {
  final String? _selectedCustomer;
  final String? _selectedCalender;
  final String? _selectedUnit;
  final String? _selectedMethod;

  const BillCreate({
    this._selectedCustomer,
    this._selectedCalender,
    this._selectedUnit,
    this._selectedMethod,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Fatura Oluştur',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              spacing: 3,
              children: [
                Icon(Icons.save, color: Colors.black),
                Text('Kaydet', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: GeneralStyle.elevation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Müşteri Bilgileri',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                GeneralStyle.borderRadius,
                              ),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              spacing: 2,
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: Icon(Icons.person_2_outlined),
                                ),
                                Text(
                                  _selectedCustomer ?? 'Müşteri Seçin',
                                  style: TextStyle(
                                    color: _selectedCustomer == null
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_drop_down_outlined, size: 32),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            AppNavigation.navigateTo(
                              context,
                              ClientAddScreen(),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                GeneralStyle.borderRadius,
                              ),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              spacing: 2,
                              children: [
                                SizedBox(width: 50, child: Icon(Icons.add)),
                                Text(
                                  'Yeni Müşteri Ekle',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fatura Bilgileri',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          _BillsInfo(
                            title: 'Fatura Numaranız',
                            prefixIcon: Icons.article,
                            hintTitle: 'Numaranızı Giriniz',
                          ),
                          Spacer(),
                          _BillsInfo(
                            title: 'Fatura Tarihi',
                            prefixIcon: Icons.calendar_month,
                            hintTitle: 'Tarih Seç',
                          ),
                        ],
                      ),
                      Text(
                        'Son ödeme tarihi',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blueGrey[50],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.calendar_month),
                              Text(_selectedCalender ?? 'Tarih Secin'),
                              Spacer(),
                              Icon(Icons.arrow_drop_down, size: 32),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ürün / Hizmetler',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          spacing: 20,
                          children: [
                            _BillsInfo(
                              prefixIcon: Icons.note,
                              widht: 170,
                              title: 'Açıklama',
                              hintTitle: 'Web/Mobile/',
                            ),
                            _BillsInfo(
                              prefixIcon: Icons.currency_lira,
                              widht: 170,
                              title: 'Tutar',
                              hintTitle: '100',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,

                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ödeme Bilgileri',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Para Birimi',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Container(
                          height: 40,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blueGrey[50],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              spacing: 10,
                              children: [
                                Icon(Icons.currency_lira),
                                Text(_selectedUnit ?? 'Birim Seçin'),
                                Spacer(),
                                Icon(Icons.arrow_drop_down, size: 32),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Ödeme Yöntemi',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Container(
                          height: 40,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blueGrey[50],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              spacing: 10,
                              children: [
                                Icon(Icons.credit_card),
                                Text(_selectedMethod ?? 'Banka Transferi'),
                                Spacer(),
                                Icon(Icons.arrow_drop_down, size: 32),
                              ],
                            ),
                          ),
                        ),

                        Row(
                          spacing: 20,
                          children: [
                            _BillsInfo(
                              height: 50,
                              prefixIcon: Icons.note,
                              widht: 362,
                              title: 'Not(Opsiyonel)',
                              hintTitle: 'Fatura Notu Ekleyebilirsin',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _BillsInfo extends StatelessWidget {
  final String title;
  final IconData prefixIcon;
  final String hintTitle;
  final double? widht;
  final double? height;

  const _BillsInfo({
    required this.title,
    required this.prefixIcon,
    required this.hintTitle,
    this.widht,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w400)),
        SizedBox(
          height: height ?? 50,
          width: widht ?? 170,
          child: TextField(
            maxLength: 20,
            decoration: InputDecoration(
              counterText: '',
              prefixIcon: Icon(prefixIcon),
              hintText: hintTitle,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
