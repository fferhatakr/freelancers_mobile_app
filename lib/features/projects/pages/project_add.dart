import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/project_from_field.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class ProjectAdd extends StatefulWidget {
  ProjectAdd({super.key});

  @override
  State<ProjectAdd> createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  final projectName = TextEditingController();
  final customerName = TextEditingController();
  final aciklama = TextEditingController();

  final projectAmount = TextEditingController();

  final note = TextEditingController();

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  String? selectedCustomer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text(
          'Proje Ekle',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            spacing: 10,
            children: [
              ProjectFormField(
                controller: projectName,
                icon: Icons.task_sharp,
                title: 'Proje Adı *',
                title2: 'Proje Adını Giriniz',
              ),
              InkWell(
                onTap: () async {
                  final customer = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        child: ValueListenableBuilder(
                          valueListenable: CustomerProvider(),
                          builder: (context, value, child) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: ListView.builder(
                                  itemCount: value.length,
                                  itemBuilder: (context, index) {
                                    final customerName = value[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.blueGrey[200],
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.pop(
                                                context,
                                                customerName.adSoyad,
                                              );
                                            },
                                            title: Text(customerName.adSoyad),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(customerName.email),
                                                Text(customerName.telefon),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                  setState(() {
                    selectedCustomer = customer;
                  });
                },
                child: SelectionTile(
                  icon2: Icons.people,
                  title2: 'Müşteri *',
                  subtitle2: selectedCustomer?.toString() ?? 'Müşteri Seçiniz',
                ),
              ),
              ProjectFormField(
                controller: aciklama,
                icon: Icons.comment,
                title: 'Açıklama',
                title2: 'Proje Hakkında Detaylı Bilgi Girin',
              ),
              ProjectFormField(
                icon: Icons.calendar_month,
                title: 'Başlangıç Tarihi',
                title2: 'GG/AA/YYYY',
                controller: startDateController,
              ),
              ProjectFormField(
                icon: Icons.calendar_month,
                title: 'Bitiş Tarihi',
                title2: 'GG/AA/YYYY',
                controller: endDateController,
              ),
              ProjectFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: TextEditingController(),
                icon: Icons.currency_lira_outlined,
                title: 'Proje Ücreti',
                title2: '₺ 0.00',
              ),

              ProjectFormField(
                controller: note,
                icon: Icons.comment,
                title: 'Notlar',
                title2: 'Ek notlarınızı Yazın',
              ),
              ElevatedButton(
                onPressed: () {
                  final project = Project(
                    projectName: projectName.text,
                    musteriName: customerName.text,
                  );
                  ProjectProvider().addProject(items: project);
                  Navigator.pop(context);
                },
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: Colors.amber[600]),
                    Text('Kaydet', style: TextStyle(color: Colors.amber[600])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
