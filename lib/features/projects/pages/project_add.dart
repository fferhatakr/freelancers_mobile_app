import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/core/utils/date_formatter.dart';
import 'package:freelancer_tracking_system/features/date/page/date.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/project_from_field.dart';
import 'package:freelancer_tracking_system/providers/customer.dart';
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
    content: Text(ProjectStrings.requiredField),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.amber,
        title: Text(ProjectStrings.projeEkle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p24),
          child: Column(
            spacing: AppSpacing.sm,
            children: [
              ProjectFormField(
                controller: projectNameController,
                icon: Icons.task_sharp,
                title: ProjectStrings.projeAdi,
                title2: ProjectStrings.projeAdiEkle,
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
                              padding: EdgeInsets.all(AppPadding.p8),
                              child: ListView.builder(
                                itemCount: value.length,
                                itemBuilder: (context, index) {
                                  final customerName = value[index];
                                  return Padding(
                                    padding: EdgeInsets.all(AppPadding.p8),
                                    child: Card(
                                      color: AppColors.white,
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: ListTile(
                                          onTap: () {
                                            Navigator.pop(
                                              context,
                                              customerName.adSoyad,
                                            );
                                          },
                                          title: Text(
                                            customerName.adSoyad,
                                            style: TextStyle(
                                              color: AppColors.black,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                customerName.email,
                                                style: TextStyle(
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Text(
                                                customerName.telefon,
                                                style: TextStyle(
                                                  color: AppColors.black,
                                                ),
                                              ),
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
                  title2: ProjectStrings.musteri,
                  subtitle2:
                      selectedCustomer?.toString() ?? ProjectStrings.musteriSec,
                ),
              ),
              ProjectFormField(
                controller: aciklamaController,
                icon: Icons.comment,
                title: ProjectStrings.aciklama,
                title2: ProjectStrings.aciklamaDetay,
              ),
              DatePicture(
                icon: Icons.calendar_month,
                title: ProjectStrings.baslangicTarihi,
                title2: toFormat(selectedStartDate) ?? ProjectStrings.secilmedi,
                onDateSelected: (date) {
                  setState(() {
                    selectedEndDate = date;
                  });
                },
                iconColor: AppColors.amber,
              ),
              DatePicture(
                icon: Icons.calendar_month,
                title: ProjectStrings.bitisTarihi,
                title2: toFormat(selectedStartDate) ?? ProjectStrings.secilmedi,
                onDateSelected: (date) {
                  setState(() {
                    selectedStartDate = date;
                  });
                },
                iconColor: AppColors.amber,
              ),
              ProjectFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: projectAmountController,
                icon: Icons.currency_lira_outlined,
                title: ProjectStrings.projeUcreti,
                title2: ProjectStrings.zeroK,
              ),

              ProjectFormField(
                controller: noteController,
                icon: Icons.comment,
                title: ProjectStrings.notlar,
                title2: ProjectStrings.ekNot,
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
                  spacing: AppSpacing.sm,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: AppColors.amber),
                    Text(
                      ProjectStrings.kaydet,
                      style: TextStyle(color: AppColors.amber),
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
}
