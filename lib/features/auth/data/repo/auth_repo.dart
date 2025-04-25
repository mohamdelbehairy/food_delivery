import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<void> registerEmail(String email, String password);
  Future<void> loginEmail(String email, String password);
  Future<UserCredential?> loginUsingGoogle();
  Future<void> loginUsingFacebook();
  Future<UserCredential?> loginUsingTwitter();
}
