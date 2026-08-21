import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_add.dart';
import 'package:freelancer_tracking_system/features/customer/widgets/customer_card.dart';
import 'package:freelancer_tracking_system/providers/customer.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  final String _noResult = 'No results found';

  final List<Customer> _allCustomer = CustomerProvider().value;
  List<Customer> _foundCustomer = [];
  @override
  void initState() {
    super.initState();
    _foundCustomer = CustomerProvider().value;
  }

  void _runFilter(String enteredKeyword) {
    List<Customer> result = [];
    if (enteredKeyword.isEmpty) {
      result = _allCustomer;
    } else {
      result = _allCustomer
          .where(
            (customer) => customer.adSoyad.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }
    setState(() {
      _foundCustomer = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CommonStrings.musteriler),

        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              AppNavigation.navigateTo(context, CustomerAddScreen());
            },
            icon: _personAdd(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: _clientSearch()),
            Expanded(
              child: _foundCustomer.isNotEmpty
                  ? ValueListenableBuilder(
                      key: UniqueKey(),
                      valueListenable: CustomerProvider(),
                      builder: (context, allCustomer, child) {
                        return ListView.builder(
                          itemCount: _foundCustomer.length,
                          itemBuilder: (context, index) {
                            final customer = _foundCustomer[index];
                            return Dismissible(
                              onDismissed: (direction) {
                                CustomerProvider().removeCustomer(customer);
                              },
                              key: ValueKey(customer.id),
                              child: CustomerCard(
                                name: customer.adSoyad,
                                telefon: customer.telefon,
                                email: customer.email,
                                firma: customer.firma,
                                not: customer.not,
                                adres: customer.adres,
                                aciklama: customer.comment,
                              ),
                            );
                          },
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        _noResult,
                        style: TextStyle(fontSize: AppSizes.size24),
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
      onChanged: (value) {
        _runFilter(value);
      },
      autofocus: true,
      maxLength: GeneralStyle.textFieldMaxLenght,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r10),
        ),
        suffixIcon: Icon(Icons.search_outlined),
        labelText: CommonStrings.hizliArama,
        labelStyle: TextStyle(color: AppColors.black),
        hintText: CommonStrings.musteriAra,
        hintStyle: TextStyle(color: AppColors.black),
      ),
    );
  }

  CircleAvatar _personAdd() {
    return CircleAvatar(
      backgroundColor: AppColors.black,
      child: Icon(Icons.person_add, color: AppColors.white),
    );
  }
}
