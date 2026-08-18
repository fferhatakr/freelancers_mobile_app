import 'package:flutter/material.dart';

class DatePicture extends StatefulWidget {
  final IconData icon;
  final String title;
  final String title2;
  final Color iconColor;
  final ValueChanged<DateTime> onDateSelected;
  const DatePicture({
    required this.icon,
    required this.title,
    required this.title2,
    required this.onDateSelected,
    required this.iconColor,
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
      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[50],
      child: ListTile(
        onTap: () {
          _selectDate();
        },
        leading: Icon(widget.icon, color: widget.iconColor),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              widget.title2,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
