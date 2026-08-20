import 'package:flutter/material.dart';

class SSS extends StatelessWidget {
  const SSS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yardım / SSS')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          _FaqTile(
            question: 'Nasıl yeni görev eklerim?',
            answer:
                'Görevler sekmesinde sağ alttaki veya üstteki "Görev Ekle" '
                'butonuna dokun. Görev adı, açıklama, bağlantılı müşteri, '
                'proje, başlangıç/bitiş tarihi, süre ve zorluk seviyesi gibi '
                'bilgileri doldurup "Kaydedildi" butonuna basman yeterli.',
          ),
          _FaqTile(
            question: 'Yıldızlı (*) alanlar ne anlama geliyor?',
            answer:
                'Yıldız işaretli alanlar zorunludur. Bu alanları boş '
                'bırakırsan uygulama seni uyarır ve görev kaydedilmez.',
          ),
          _FaqTile(
            question: 'Görevin durumunu nasıl değiştiririm?',
            answer:
                'Görev kartına dokun, açılan menüden "Devam Ediyor", '
                '"Beklemede" veya "Tamamlandı" seçeneklerinden birini seç. '
                'Durum anında güncellenir.',
          ),
          _FaqTile(
            question: 'Başlangıç ve bitiş tarihini nasıl seçerim?',
            answer:
                'Görev ekleme ekranındaki tarih alanına dokun, açılan '
                'takvimden istediğin günü seç. Seçtiğin tarih otomatik '
                'olarak ekranda görünecektir.',
          ),
          _FaqTile(
            question: 'Yeni müşteri veya proje nasıl eklerim?',
            answer:
                'Görev ekleme ekranındaki "Bağlantılı Müşteri" veya '
                '"Bağlantılı Proje" alanına dokun, açılan listeden mevcut '
                'kayıtları seçebilirsin. Yeni müşteri/proje eklemek '
                'istiyorsan ilgili sekmeden ekleme yapabilirsin.',
          ),
          _FaqTile(
            question: 'Verilerim nerede saklanıyor, güvenli mi?',
            answer:
                'Verilerin Firebase altyapısında saklanır. Detaylı bilgi '
                'için Ayarlar > Gizlilik Politikası sayfasını '
                'inceleyebilirsin.',
          ),
          _FaqTile(
            question: 'Bir görevi nasıl silerim?',
            answer:
                'Silmek istediğin görev kartını basılı tut veya kart '
                'üzerindeki ilgili menüyü kullan, ardından "Sil" seçeneğini '
                'onayla.',
          ),
          _FaqTile(
            question: 'Sorunumu burada çözemedim, ne yapmalıyım?',
            answer:
                'Aşağıdaki iletişim bilgilerinden bize ulaşabilirsin, '
                'sorununu en kısa sürede yanıtlamaya çalışırız.',
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mail_outline, size: 18),
              const SizedBox(width: 6),
              Text(
                'freelio@gmail.com',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            answer,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[800],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
