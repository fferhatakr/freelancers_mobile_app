import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/utils/date_formatter.dart';
import 'package:freelancer_tracking_system/features/date/page/date.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/project_from_field.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class ProjectAdd extends StatefulWidget {
  const ProjectAdd({super.key});

  @override
  State<ProjectAdd> createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  final projectNameController = TextEditingController();
  final customerNameController = TextEditingController();
  final aciklamaController = TextEditingController();
  final projectAmountController = TextEditingController();
  final noteController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  String? selectedCustomer;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  double? price;
  final SnackBar _requiredField = SnackBar(
    content: Text('Zorunlu Alanı Doldurunuz'),
  );

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
                controller: projectNameController,
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
                controller: aciklamaController,
                icon: Icons.comment,
                title: 'Açıklama',
                title2: 'Proje Hakkında Detaylı Bilgi Girin',
              ),
              DatePicture(
                icon: Icons.calendar_month,
                title: 'Başlangıç Tarihi ',
                title2: toFormat(selectedStartDate) ?? 'Seçilmedi',
                onDateSelected: (date) {
                  setState(() {
                    selectedEndDate = date;
                  });
                },
                iconColor: Colors.amber,
              ),
              DatePicture(
                icon: Icons.calendar_month,
                title: 'Bitiş Tarihi ',
                title2: toFormat(selectedStartDate) ?? 'Seçilmedi',
                onDateSelected: (date) {
                  setState(() {
                    selectedStartDate = date;
                  });
                },
                iconColor: Colors.amber,
              ),
              ProjectFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: projectAmountController,
                icon: Icons.currency_lira_outlined,
                title: 'Proje Ücreti',
                title2: '₺ 0.00',
              ),

              ProjectFormField(
                controller: noteController,
                icon: Icons.comment,
                title: 'Notlar',
                title2: 'Ek notlarınızı Yazın',
              ),
              ElevatedButton(
                onPressed: () {
                  final project = Project(
                    projectName: projectNameController.text,
                    selectedCustomer: selectedCustomer,
                    projectAmount: double.parse(projectAmountController.text),
                  );
                  setState(() {
                    price = project.projectAmount;
                  });
                  if (projectNameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(_requiredField);
                  } else {
                    ProjectProvider().addProject(items: project);
                    Navigator.pop(context);
                  }
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
