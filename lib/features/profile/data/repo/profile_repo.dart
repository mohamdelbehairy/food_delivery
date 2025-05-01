import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_data_model.dart';

abstract class ProfileRepo {
  Future<File?> pickImage();
  Future<void> addUserData(UserDataModel userDataModel);
  void getUserData(void Function(QuerySnapshot<Map<String, dynamic>>)? onData);
  Future<bool> isUserExist(String userID);
}
