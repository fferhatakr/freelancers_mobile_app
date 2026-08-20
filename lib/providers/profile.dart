import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider._sharedInstance();
  static final ProfileProvider _shared = ProfileProvider._sharedInstance();
  factory ProfileProvider() => _shared;

  String? name;
  File? photo;
  String? phone;
  String? job;
  void updateProfile(String name, File photo, String phone, String job) {
    this.name = name;
    this.photo = photo;
    this.phone = phone;
    this.job = job;
    notifyListeners();
  }
}
