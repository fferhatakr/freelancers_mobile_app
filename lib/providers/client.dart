import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier {
  final List<Customer> _customers = [];

  List<Customer> get items => _customers;

  void addCustomer(Customer items) {
    _customers.add(items);
    notifyListeners();
  }

  void removeCustomer(Customer items) {
    _customers.remove(items);
    notifyListeners();
  }

  void removeAllCustomer() {
    _customers.clear();
    notifyListeners();
  }
}

class Customer {
  final String adSoyad;
  final String email;
  final String telefon;
  final String? firma;
  final String? not;
  final String? adres;
  final String? source;
  final String? aciklama;
  Customer({
    required this.adSoyad,
    required this.email,
    required this.telefon,
    this.firma,
    this.not,
    this.adres,
    this.source,
    this.aciklama,
  });
}
