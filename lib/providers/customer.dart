import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'customer.g.dart';

class CustomerProvider extends ValueNotifier<List<Customer>> {
  //Nerede çağrılırsa çağrılsın aynı provider nesnesini kullanmak
  CustomerProvider._sharedInstance()
    : super([]); //Super ile başlangıçta boş bir müşteri oluşur.
  static final CustomerProvider _shared =
      CustomerProvider._sharedInstance(); // oluşan müşteriyi saklar.
  factory CustomerProvider() => _shared; //CustomerProvider diyerek çağırırız.

  late Box<Customer> box;
  void addCustomer({required Customer items}) async {
    value.add(items);
    await box.add(items);
    notifyListeners();
  }

  void removeCustomer(Customer items) {
    value.remove(items);
    items.delete();
    notifyListeners();
  }

  void loadCustomer() {
    value = box.values.toList();
    notifyListeners();
    return;
  }
}

@HiveType(typeId: 6)
class Customer extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String adSoyad;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String telefon;
  @HiveField(4)
  final String? firma;
  @HiveField(5)
  final String? not;
  @HiveField(6)
  final String? adres;
  @HiveField(7)
  final String? source;
  @HiveField(8)
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
