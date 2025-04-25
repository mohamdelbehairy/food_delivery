import 'package:firebase_auth/firebase_auth.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<bool> registerEmail(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return credential.user != null;
  }

  @override
  Future<bool> loginEmail(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return credential.user != null;
  }
}
