import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_add.dart';
import 'package:freelancer_tracking_system/features/date/page/date.dart';
import 'package:freelancer_tracking_system/core/utils/date_formatter.dart';

class BillCreate extends StatefulWidget {
  final String? _selectedCustomer;
  final String? _selectedUnit;
  final String? _selectedMethod;

  const BillCreate({
    this._selectedCustomer,
    this._selectedUnit,
    this._selectedMethod,
    super.key,
  });

  @override
  State<BillCreate> createState() => _BillCreateState();
}

class _BillCreateState extends State<BillCreate> {
  DateTime? selectedEndDate;
  DateTime? selectedBillsCalender;

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
          padding: const EdgeInsets.all(GeneralStyle.paddingSize),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(GeneralStyle.paddingSize),
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
                                  widget._selectedCustomer ?? 'Müşteri Seçin',
                                  style: TextStyle(
                                    color: widget._selectedCustomer == null
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
                              CustomerAddScreen(),
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
                      _BillsInfo(
                        widht: double.infinity,
                        title: 'Fatura Numaranız',
                        prefixIcon: Icons.article,
                        hintTitle: 'Numaranızı Giriniz',
                      ),
                      DatePicture(
                        icon: Icons.calendar_month,
                        title: 'Fatura Tarihi',
                        title2:
                            '${toFormat(selectedBillsCalender) ?? ' Tarih Seçilmedi'} ',
                        onDateSelected: (date) {
                          setState(() {
                            selectedBillsCalender = date;
                          });
                        },
                        iconColor: Colors.purpleAccent,
                      ),
                      DatePicture(
                        icon: Icons.calendar_month,
                        title: 'Son Ödeme Tarihi Seçin',
                        title2:
                            '${toFormat(selectedEndDate) ?? ' Tarih Seçilmedi'} ',
                        onDateSelected: (date) {
                          setState(() {
                            selectedEndDate = date;
                          });
                        },
                        iconColor: Colors.purpleAccent,
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
                                Text(widget._selectedUnit ?? 'Birim Seçin'),
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
                                Text(
                                  widget._selectedMethod ?? 'Banka Transferi',
                                ),
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
