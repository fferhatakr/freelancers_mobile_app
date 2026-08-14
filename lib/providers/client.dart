import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CustomerProvider extends ValueNotifier<List<Customer>> {
  //Nerede çağrılırsa çağrılsın aynı provider nesnesini kullanmak
  CustomerProvider._sharedInstance()
    : super([]); //Super ile başlangıçta boş bir müşteri oluşur.
  static final CustomerProvider _shared =
      CustomerProvider._sharedInstance(); // oluşan müşteriyi saklar.
  factory CustomerProvider() => _shared; //CustomerProvider diyerek çağırırız.

  void addCustomer({required Customer items}) {
    value.add(items);
    notifyListeners();
  }

  void removeCustomer(Customer items) {
    value.remove(items);
    notifyListeners();
  }
}

class Customer {
  final String id;
  final String adSoyad;
  final String email;
  final String telefon;
  final String? firma;
  final String? not;
  final String? adres;
  final String? source;
  final String? comment;
  Customer({
    required this.adSoyad,
    required this.email,
    required this.telefon,
    this.firma,
    this.not,
    this.adres,
    this.source,
    this.comment,
  }) : id = const Uuid().v4();
}
