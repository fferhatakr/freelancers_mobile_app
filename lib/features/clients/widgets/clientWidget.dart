import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_all_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_style.dart';
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
      height: ClientsStyle.listHeight,
      child: Card(
        elevation: GeneralStyle.elevation,
        shape: _listTileShape(),
        child: ListTile(
          leading: _CircleAvatar(),

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
    );
  }

  RoundedRectangleBorder _listTileShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(GeneralStyle.radiusCircular),
      ),
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  const _CircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ClientsStyle.circleAvatarColor,
      child: Icon(ClientsStyle.personIcon, color: ClientsStyle.personIconColor),
    );
  }
}
