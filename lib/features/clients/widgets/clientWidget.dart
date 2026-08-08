import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';

class ClientList extends StatelessWidget {
  final String name;
  final String surname;
  final String email;

  const ClientList({
    required this.name,
    required this.surname,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        elevation: 10,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: SizedBox(
          height: 10,
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.clientWidget,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(Icons.person_2_outlined),
            ),

            title: Text('$name $surname'),
            subtitle: Row(
              children: [
                Icon(Icons.email, size: 15),
                SizedBox(width: 5),
                Text('$email'),
              ],
            ),
            trailing: GestureDetector(
              onTap: () {
                print('Yakında');
              },
              child: Icon(Icons.chevron_right_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
