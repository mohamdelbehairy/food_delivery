import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/core/utils/constants.dart';

import '../model/user_data_model.dart';
import 'user_data_repo.dart';

class UserDataRepoImpl extends UserDataRepo {
  @override
  Future<void> addUserData(UserDataModel userDataModel) async {
    await FirebaseFirestore.instance
        .collection(Constants.userCollection)
        .doc(userDataModel.userID)
        .set(userDataModel.toJson());
  }

  @override
  void getUserData(void Function(QuerySnapshot<Map<String, dynamic>>)? onData) {
    FirebaseFirestore.instance
        .collection(Constants.userCollection)
        .snapshots()
        .listen(onData);
  }

  @override
  Future<bool> isUserExist(String userID) async {
    final doc = await FirebaseFirestore.instance
        .collection(Constants.userCollection)
        .doc(userID)
        .get();
    return doc.exists;
  }
}
