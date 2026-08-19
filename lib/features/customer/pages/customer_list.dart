import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/features/customer/pages/customer_add.dart';
import 'package:freelancer_tracking_system/features/customer/widgets/client_card.dart';
import 'package:freelancer_tracking_system/providers/client.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(CommonStrings.musteriler, style: _appBarTitle()),
            Text(CommonStrings.musterileriYonet, style: _appBarSubtitle()),
          ],
        ),

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
            _clientSearch(),
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
                              child: ClientCard(
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
        prefixIcon: Icon(Icons.search_outlined),
        labelText: CommonStrings.hizliArama,
        hintText: CommonStrings.musteriAra,
        hintStyle: TextStyle(color: AppColors.grey),
      ),
    );
  }

  CircleAvatar _personAdd() {
    return CircleAvatar(
      backgroundColor: AppColors.blueAccent,
      child: Icon(Icons.person_add, color: AppColors.white),
    );
  }

  TextStyle _appBarSubtitle() {
    return TextStyle(fontSize: AppSizes.size12, fontWeight: FontWeight.w300);
  }

  TextStyle _appBarTitle() {
    return TextStyle(fontSize: AppSizes.size24, fontWeight: FontWeight.bold);
  }
}
