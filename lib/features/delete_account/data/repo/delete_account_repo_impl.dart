import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/core/utils/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/utils/services/shared_pref_service.dart';
import 'delete_account_repo.dart';

class DeleteAccountRepoImpl extends DeleteAccountRepo {
  final SharedPrefService _sharedPrefService = SharedPrefService();
  @override
  Future<void> deleteAccount() async {
    final userID = _sharedPrefService.getString(Constants.userID);

    await FirebaseFirestore.instance
        .collection(Constants.userCollection)
        .doc(userID)
        .delete();

    await FirebaseAuth.instance.currentUser?.delete();

    await _sharedPrefService.remove(Constants.userID);
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
