import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/localization/billcreate_strings.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_add.dart';
import 'package:freelancer_tracking_system/core/archive/bill_create_widget.dart';
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
        backgroundColor: AppColors.purple,
        title: Text(
          BillsCreateString.faturaOlustur,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              spacing: AppSpacing.xs,
              children: [
                Icon(Icons.save, color: AppColors.black),
                Text(
                  BillsCreateString.musteriBilgileri,
                  style: TextStyle(color: AppColors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: _paddingTen(),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: _paddingTen(),
                  child: Column(
                    spacing: AppSpacing.xs,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        BillsCreateString.musteriBilgileri,
                        style: TextStyle(
                          fontSize: AppSizes.size16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: _paddingTen(),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: AppSizes.size48,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                GeneralStyle.borderRadius,
                              ),
                              color: AppColors.surfaceLight,
                            ),
                            child: Row(
                              spacing: AppSpacing.xxs,
                              children: [
                                SizedBox(
                                  width: AppSizes.size48,
                                  child: Icon(Icons.person_2_outlined),
                                ),
                                Text(
                                  widget._selectedCustomer ??
                                      BillsCreateString.musteriSecin,
                                  style: TextStyle(
                                    color: widget._selectedCustomer == null
                                        ? AppColors.grey
                                        : AppColors.black,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  size: AppSizes.size32,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: _paddingTen(),
                        child: InkWell(
                          onTap: () {
                            AppNavigation.navigateTo(
                              context,
                              CustomerAddScreen(),
                            );
                          },
                          child: Container(
                            height: AppSizes.size48,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                GeneralStyle.borderRadius,
                              ),
                              color: AppColors.surfaceLight,
                            ),
                            child: Row(
                              spacing: AppSpacing.xxs,
                              children: [
                                SizedBox(
                                  width: AppSizes.size48,
                                  child: Icon(Icons.add),
                                ),
                                Text(
                                  BillsCreateString.yeniMusteriEkle,
                                  style: TextStyle(color: AppColors.black),
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
                  padding: _paddingTen(),
                  child: Column(
                    spacing: AppSpacing.sm,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        BillsCreateString.faturaBilgileri,
                        style: TextStyle(
                          fontSize: AppSizes.size16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      BillsInfo(
                        widht: double.infinity,
                        title: BillsCreateString.faturaNumaraniz,
                        prefixIcon: Icons.article,
                        hintTitle: BillsCreateString.numaraniziGiriniz,
                      ),
                      DatePicture(
                        icon: Icons.calendar_month,
                        title: BillsCreateString.faturaTarihi,
                        title2:
                            '${toFormat(selectedBillsCalender) ?? {BillsCreateString.faturaTarihi}} ',
                        onDateSelected: (date) {
                          setState(() {
                            selectedBillsCalender = date;
                          });
                        },
                        iconColor: AppColors.purpleAccent,
                      ),
                      DatePicture(
                        icon: Icons.calendar_month,
                        title: BillsCreateString.sonOdemeTarihiSecin,
                        title2:
                            '${toFormat(selectedEndDate) ?? {BillsCreateString.faturaTarihi}} ',
                        onDateSelected: (date) {
                          setState(() {
                            selectedEndDate = date;
                          });
                        },
                        iconColor: AppColors.purpleAccent,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: _paddingTen(),
                    child: Column(
                      spacing: AppSpacing.sm,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          BillsCreateString.urunHizmetler,
                          style: TextStyle(
                            fontSize: AppSizes.size16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          spacing: AppSpacing.md,
                          children: [
                            BillsInfo(
                              prefixIcon: Icons.note,
                              widht: AppSizes.size170,
                              title: BillsCreateString.aciklama,
                              hintTitle: BillsCreateString.webMobile,
                            ),
                            BillsInfo(
                              prefixIcon: Icons.currency_lira,
                              widht: AppSizes.size150,
                              title: BillsCreateString.tutar,
                              hintTitle: BillsCreateString.ucret,
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
                    padding: _paddingTen(),
                    child: Column(
                      spacing: AppSpacing.sm,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          BillsCreateString.odemeBilgileri,
                          style: TextStyle(
                            fontSize: AppSizes.size16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          BillsCreateString.paraBirimi,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Container(
                          height: AppSizes.size40,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppRadius.r10),
                            ),
                            color: AppColors.surfaceBlueGreyLight,
                          ),
                          child: Padding(
                            padding: _paddingTen(),
                            child: Row(
                              spacing: 10,
                              children: [
                                Icon(Icons.currency_lira),
                                Text(
                                  widget._selectedUnit ??
                                      BillsCreateString.birimSecin,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: AppSizes.size32,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          BillsCreateString.odemeYontemi,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Container(
                          height: AppSizes.size40,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppRadius.r10),
                            ),
                            color: AppColors.surfaceBlueGreyLight,
                          ),
                          child: Padding(
                            padding: _paddingTen(),
                            child: Row(
                              spacing: AppSpacing.sm,
                              children: [
                                Icon(Icons.credit_card),
                                Text(
                                  widget._selectedMethod ??
                                      BillsCreateString.bankaTransferi,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: AppSizes.size32,
                                ),
                              ],
                            ),
                          ),
                        ),

                        BillsInfo(
                          height: AppSizes.size48,
                          prefixIcon: Icons.note,
                          widht: double.infinity,
                          title: BillsCreateString.notOpsiyonel,
                          hintTitle: BillsCreateString.faturaNotuEkleyebilirsin,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSizes.size24),
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets _paddingTen() => const EdgeInsets.all(AppPadding.p10);
}
