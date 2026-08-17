import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/task_add.dart';

class DatePicture extends StatefulWidget {
  final IconData icon;
  final String title;
  final String title2;

  const DatePicture({
    required this.icon,
    required this.title,
    required this.title2,

    super.key,
  });

  @override
  State<DatePicture> createState() => _DatePictureState();
}

class _DatePictureState extends State<DatePicture> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      locale: Locale("tr", "TR"),
      context: context,
      firstDate: DateTime(2026),
      lastDate: DateTime(2050),
      initialDate: DateTime(2026, 7, 25),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionTask(
      icon: widget.icon,
      title: widget.title,
      subtitle: selectedDate != null
          ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
          : widget.title2,
      onTap: () {
        _selectDate();
      },
    );
  }
}
