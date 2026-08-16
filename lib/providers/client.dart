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

  void seedFakeData() {
    final fakeCustomers = [
      Customer(
        adSoyad: 'Ahmet Yılmaz',
        email: 'ahmet.yilmaz@gmail.com',
        telefon: '0532 111 22 33',
        firma: 'Yılmaz Tekstil',
        adres: 'Kadıköy, İstanbul',
        source: 'Instagram',
        comment: 'Web sitesi için iletişime geçti',
        not: 'Hızlı dönüş yapan bir müşteri',
      ),
      Customer(
        adSoyad: 'Zeynep Kaya',
        email: 'zeynep.kaya@gmail.com',
        telefon: '0533 222 33 44',
        firma: 'Kaya Danışmanlık',
        adres: 'Çankaya, Ankara',
        source: 'Referans',
        comment: 'Mobil uygulama projesi görüşülüyor',
        not: 'Toplantıları hafta içi tercih ediyor',
      ),
      Customer(
        adSoyad: 'Mehmet Demir',
        email: 'mehmet.demir@hotmail.com',
        telefon: '0534 333 44 55',
        firma: null,
        adres: 'Bornova, İzmir',
        source: 'Google',
        comment: null,
        not: 'Bütçe konusunda esnek değil',
      ),
      Customer(
        adSoyad: 'Elif Şahin',
        email: 'elif.sahin@yahoo.com',
        telefon: '0535 444 55 66',
        firma: 'Şahin Mimarlık',
        adres: 'Nilüfer, Bursa',
        source: 'LinkedIn',
        comment: 'Kurumsal kimlik çalışması istiyor',
        not: 'Detaylara çok dikkat ediyor',
      ),
      Customer(
        adSoyad: 'Can Öztürk',
        email: 'can.ozturk@gmail.com',
        telefon: '0536 555 66 77',
        firma: 'Öztürk Lojistik',
        adres: 'Muratpaşa, Antalya',
        source: 'Website',
        comment: null,
        not: 'Fiyat konusunda hassas',
      ),
      Customer(
        adSoyad: 'Ayşe Arslan',
        email: 'ayse.arslan@gmail.com',
        telefon: '0537 666 77 88',
        firma: null,
        adres: 'Osmangazi, Bursa',
        source: 'Instagram',
        comment: 'Sosyal medya yönetimi istiyor',
        not: 'İçerik onayları biraz gecikebiliyor',
      ),
      Customer(
        adSoyad: 'Burak Aydın',
        email: 'burak.aydin@outlook.com',
        telefon: '0538 777 88 99',
        firma: 'Aydın Yazılım',
        adres: 'Şişli, İstanbul',
        source: 'Referans',
        comment: 'Uzun vadeli iş birliği düşünüyor',
        not: 'Teknik detaylarla ilgileniyor',
      ),
      Customer(
        adSoyad: 'Selin Koç',
        email: 'selin.koc@gmail.com',
        telefon: '0539 888 99 00',
        firma: 'Koç Medya',
        adres: 'Konak, İzmir',
        source: 'Google',
        comment: null,
        not: 'Acil teslim istiyor',
      ),
      Customer(
        adSoyad: 'Kerem Yıldız',
        email: 'kerem.yildiz@gmail.com',
        telefon: '0530 999 00 11',
        firma: null,
        adres: 'Etimesgut, Ankara',
        source: 'Website',
        comment: 'API entegrasyonu için görüşülüyor',
        not: 'Teknik ekiple direkt görüşmek istiyor',
      ),
      Customer(
        adSoyad: 'Deniz Aksoy',
        email: 'deniz.aksoy@hotmail.com',
        telefon: '0531 000 11 22',
        firma: 'Aksoy Ticaret',
        adres: 'Pendik, İstanbul',
        source: 'LinkedIn',
        comment: 'Veritabanı optimizasyonu talep etti',
        not: 'Raporları düzenli istiyor',
      ),
    ];

    value.addAll(fakeCustomers);
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
