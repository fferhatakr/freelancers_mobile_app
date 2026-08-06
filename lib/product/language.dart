import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/schema/classes.dart';

class language {
  static String aktifProjelerim = 'Aktif Projelerim';
  static String tamamlananProjeler = 'Tamamlanan Projeler';
  static String bekleyenOdeme = 'Bekleyen Ödeme ';
  static String hosgeldinKullanici = 'Hoşgeldin Ferhat';

  List<Object> aktifProjeler = [
    {hardcodeVeri().project1},
    {hardcodeVeri().project2},
    {hardcodeVeri().project3},
  ];
  List<int> bekleyenOdemeler = [1000, 2000, 3000, 4321];
  static String hizliIslemler = 'Hızlı İşlemler';
  static String faturaOlustur = 'Fatura Oluştur';
  static String yeniFaturaekle = 'Yeni Fatura Ekle';
  static String yeniMusteri = 'Yeni Musteri';
  static String musteriKaydiEkle = 'Müşteri Kaydı Ekle';
  static String projeEkle = 'Proje Ekle';
  static String yeniKazancSagla = 'Yeni Kazanç Sağla';
  static String gorevEkle = 'Görev Ekle';
  static String projeniSaglamaAl = 'Projeni Sağlama Al';
}
