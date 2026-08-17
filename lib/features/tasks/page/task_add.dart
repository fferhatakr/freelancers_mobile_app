import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/date/page/date.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/task_add.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/providers/project.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TasksAdd extends StatefulWidget {
  const TasksAdd({super.key});

  @override
  State<TasksAdd> createState() => _TasksAddState();
}

final tasksNameController = TextEditingController();
final commentController = TextEditingController();
final noteController = TextEditingController();
final startDate = TextEditingController();
final endDate = TextEditingController();
final watchController = TextEditingController();
final statusController = TextEditingController();

class _TasksAddState extends State<TasksAdd> {
  String? selectedCustomerName;
  String? selectedProject;
  Levels? selectedLevel;

  final SnackBar requiredFields = SnackBar(
    content: Text('Zorunlu Alanları Giriniz'),
  );

  DateTime? selectedDate;
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      locale: Locale("tr", "TR"),
      context: context,
      firstDate: DateTime(2026),
      lastDate: DateTime(2027),
      initialDate: DateTime(2026, 7, 25),
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 33, 18),
        title: Text('Görev Ekle', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskAdd(
                maxLength: 20,
                controller: tasksNameController,
                icon: Icons.add_task_outlined,
                title: 'Görev İsmi *',
                subtitle: 'Görev Adını Giriniz',
              ),
              TaskAdd(
                maxLength: 20,
                controller: commentController,
                icon: Icons.article,
                title: 'Açıklama *',
                subtitle: 'Açıklama Ekle',
              ),
              SelectionTask(
                icon: Icons.person_2_outlined,
                title: 'Bağlantılı Müşteri * ',
                subtitle: selectedCustomerName ?? 'Müşteri Seçiniz',
                onTap: () async {
                  final customerName = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return ValueListenableBuilder(
                        valueListenable: CustomerProvider(),
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              final customer = value[index];
                              return Padding(
                                padding: _paddingSize(),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(
                                      context,
                                      customer.adSoyad,
                                    ); //Müşterinin seçtiği değerin ismini alıyoruz
                                  },
                                  child: Card(
                                    color: Colors.blueGrey[50],
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(Icons.person_2_outlined),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            customer.adSoyad,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            customer.email,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            customer.telefon,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                  setState(() {
                    selectedCustomerName =
                        customerName; //yenileyerek seçtiği ismi seçilen isme yansıtıyoruz.
                  });
                },
              ),
              SelectionTask(
                icon: Icons.search,
                title: 'Bağlantılı Proje*',
                subtitle: selectedProject ?? 'Mobile App',
                onTap: () async {
                  final projectName = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,

                        child: ValueListenableBuilder(
                          valueListenable: ProjectProvider(),
                          builder: (context, projectIndex, child) {
                            return ListView.builder(
                              itemCount: projectIndex.length,
                              itemBuilder: (context, index) {
                                final project = projectIndex[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pop(context, project.projectName);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Card(
                                      color: Colors.blueGrey[50],
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          child: Icon(
                                            Icons.work,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: Text(project.projectName),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                  setState(() {
                    selectedProject = projectName;
                  });
                },
              ),
              DatePicture(
                icon: Icons.calendar_month,
                title: 'Başlangıç Tarihi',
                title2: 'Tarih Giriniz',
              ),
              DatePicture(
                icon: Icons.calendar_view_day_rounded,
                title: 'Bitiş Tarihi',
                title2: 'Tarih Giriniz',
              ),
              TaskAdd(
                onlyRead: false,
                maxLength: 8,
                icon: Icons.watch,
                title: 'Kaç saat sürücek?*',
                subtitle: 'Saat Belirle',
                controller: watchController,
              ),
              TaskAdd(
                maxLength: 20,
                controller: noteController,
                icon: Icons.note_add,
                title: 'Not ekleyin',
                subtitle: 'Görev Notlarını ekleyin',
              ),
              SelectionTask(
                icon: Icons.flag,
                title: 'Zorluk *',
                subtitle: selectedLevel?.label ?? 'Derece Belirtin',
                onTap: () async {
                  final level = await showModalBottomSheet<Levels>(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text('Kolay'),
                              onTap: () {
                                Navigator.pop(context, Levels.kolay);
                              },
                            ),
                            ListTile(
                              title: Text('Orta'),
                              onTap: () {
                                Navigator.pop(context, Levels.orta);
                              },
                            ),
                            ListTile(
                              title: Text('Zor'),
                              onTap: () {
                                Navigator.pop(context, Levels.zor);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  setState(() {
                    selectedLevel = level;
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                  final task = Task(
                    taskName: tasksNameController.text,
                    comment: commentController.text,
                    bagliMusteri: selectedCustomerName,
                    baglantiliProje: selectedProject,
                    saat: watchController.text,
                    levels: selectedLevel.toString(),
                  );
                  if (tasksNameController.text.trim().isEmpty ||
                      commentController.text.trim().isEmpty ||
                      watchController.text.trim().isEmpty ||
                      selectedCustomerName == null ||
                      selectedProject == null ||
                      selectedLevel == null) {
                    ScaffoldMessenger.of(context).showSnackBar(requiredFields);
                  } else {
                    TaskProvider().addTasks(items: task);
                    Navigator.pop(context);
                  }
                  print(task.startDate.toString());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: Color.fromARGB(255, 245, 33, 18)),
                    Text(
                      'Kaydedildi',
                      style: TextStyle(color: Color.fromARGB(255, 245, 33, 18)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets _paddingSize() {
    return const EdgeInsets.symmetric(horizontal: 10);
  }
}

enum Levels {
  kolay('Kolay'),
  orta('Orta'),
  zor('Zor');

  final String label;
  const Levels(this.label);
}
