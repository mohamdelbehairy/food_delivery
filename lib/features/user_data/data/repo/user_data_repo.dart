import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_data_model.dart';

abstract class UserDataRepo {
  Future<void> addUserData(UserDataModel userDataModel);
  StreamSubscription getUserData(
      Function(QuerySnapshot<Map<String, dynamic>>)? onData);
  Future<bool> isUserExist(String userID);
  Future<void> updateUserData(UserDataModel userDataModel);
}
