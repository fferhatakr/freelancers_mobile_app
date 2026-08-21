import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'generated/profile.g.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider._sharedInstance();
  static final ProfileProvider _shared = ProfileProvider._sharedInstance();
  factory ProfileProvider() => _shared;
  late Box<Profile> box;
  Profile? profile;
  void updateProfile(String name, String path, String phone, String job) {
    profile = Profile(name: name, photo: path, phone: phone, job: job);
    box.put('profile', profile!);
    notifyListeners();
  }

  void loadProfile() {
    profile = box.get('profile');
    notifyListeners();
  }
}

@HiveType(typeId: 8)
class Profile extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? photo;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? job;

  Profile({this.name, this.photo, this.job, this.phone});
}
