// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';

import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/providers/profile.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  bool isEditingName = false;
  bool isEditingPhone = false;
  bool isEditinigJob = false;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _job = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name.text = FirebaseAuth.instance.currentUser?.displayName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Bilgileri'),
        actions: [
          isEditingName == true ||
                  isEditingPhone == true ||
                  isEditinigJob == true
              ? TextButton(
                  onPressed: () async {
                    if (_name.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('İsim Boş Bırakılamaz')),
                      );
                    } else {
                      await FirebaseAuth.instance.currentUser
                          ?.updateDisplayName(_name.text.trim());
                      setState(() {
                        ProfileProvider().phone = _phone.text.trim();
                        ProfileProvider().job = _job.text.trim();

                        isEditingName = false;
                        isEditingPhone = false;
                        isEditinigJob = false;
                      });
                    }
                  },
                  child: Text('Kaydet'),
                )
              : Text(''),
        ],
      ),
      body: SingleChildScrollView(
        child: ListenableBuilder(
          listenable: ProfileProvider(),
          builder: (context, child) {
            return Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: AppSizes.size100,
                    backgroundColor: AppColors.black,
                    child: CircleAvatar(
                      radius: AppSizes.size96,
                      backgroundImage: ProfileProvider().photo != null
                          ? FileImage(ProfileProvider().photo!)
                          : null,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var photo = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (photo != null) {
                      ProfileProvider().updateProfile(
                        ProfileProvider().name ?? '',
                        File(photo.path),
                        ProfileProvider().phone ?? '',
                        ProfileProvider().job ?? '',
                      );
                    }
                  },
                  child: Text('Change Photo'),
                ),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p10),
                  child: Container(
                    height: AppSizes.size64,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppRadius.r10),
                      ),
                      color: AppColors.surfaceBlueGreyLight,
                    ),
                    child: isEditingName != true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ad Soyad',
                                      style: TextStyle(
                                        fontSize: AppSizes.size14,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: AppSizes.size300,
                                          child: Text(
                                            FirebaseAuth
                                                    .instance
                                                    .currentUser
                                                    ?.displayName ??
                                                'Kullanıcı Adı Bulunamadı',
                                            style: TextStyle(
                                              fontSize: AppSizes.size16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isEditingName = true;
                                              });
                                            },
                                            child: Icon(Icons.edit),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : _EditingTextField(
                            controller: _name,
                            labelText: 'İsim Girinizi',
                            hintText: 'İsim Giriniz',
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p10),
                  child: Container(
                    height: AppSizes.size64,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppRadius.r10),
                      ),
                      color: AppColors.surfaceBlueGreyLight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'E-posta',
                                style: TextStyle(fontSize: AppSizes.size14),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: AppSizes.size300,
                                    child: Text(
                                      FirebaseAuth
                                              .instance
                                              .currentUser
                                              ?.email ??
                                          'Kullanıcı Adı Bulunamadı',
                                      style: TextStyle(
                                        fontSize: AppSizes.size16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Icon(Icons.lock)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p10),
                  child: Container(
                    height: AppSizes.size64,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppRadius.r10),
                      ),
                      color: AppColors.surfaceBlueGreyLight,
                    ),
                    child: isEditingPhone != true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Telefon',
                                      style: TextStyle(
                                        fontSize: AppSizes.size14,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: AppSizes.size300,
                                          child: ProfileProvider().phone == null
                                              ? Text(
                                                  'Ekle',
                                                  style: TextStyle(
                                                    fontSize: AppSizes.size16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : Text(
                                                  '+90 ${ProfileProvider().phone}'
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: AppSizes.size16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isEditingPhone = true;
                                              });
                                            },
                                            child: Icon(Icons.edit),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : _EditingTextField(
                            maxLength: 10,
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _phone,
                            labelText: 'Telefon Giriniz',
                            hintText: '10 rakamdan oluşmalıdır.',
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p10),
                  child: Container(
                    height: AppSizes.size64,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppRadius.r10),
                      ),
                      color: AppColors.surfaceBlueGreyLight,
                    ),
                    child: isEditinigJob != true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Meslek',
                                      style: TextStyle(
                                        fontSize: AppSizes.size14,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: AppSizes.size300,
                                          child: ProfileProvider().phone == null
                                              ? Text(
                                                  'Ekle',
                                                  style: TextStyle(
                                                    fontSize: AppSizes.size16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : Text(
                                                  ProfileProvider().job ??
                                                      'Meslek Giriniz'
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: AppSizes.size16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isEditinigJob = true;
                                              });
                                            },
                                            child: Icon(Icons.edit),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : _EditingTextField(
                            maxLength: 15,
                            controller: _job,
                            labelText: 'Mesleğinizi Giriniz',
                            hintText: 'Serbest Çalışan',
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _EditingTextField extends StatelessWidget {
  const _EditingTextField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength = 16,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.size12,
        vertical: AppSizes.size12,
      ),
      child: SizedBox(
        height: AppSizes.size40,
        child: TextField(
          maxLength: maxLength,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            counterText: '',
            labelText: labelText,
            hint: Text(hintText),
            suffixIcon: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
