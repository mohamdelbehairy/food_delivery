import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/core/utils/secret_key.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<void> registerEmail(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> loginEmail(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential?> loginUsingGoogle() async {
    UserCredential? userCredential;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
    }

    return userCredential;
  }

  @override
  Future<void> loginUsingFacebook() async {}

  @override
  Future<UserCredential?> loginUsingTwitter() async {
    UserCredential? userCredential;
    final twitterLogin = TwitterLogin(
        apiKey: SecretKey.apiKey,
        apiSecretKey: SecretKey.secretKey,
        redirectURI: SecretKey.redirectURI);

    final authResult = await twitterLogin.login();

    if (authResult.status == TwitterLoginStatus.loggedIn) {
      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );
      userCredential = await FirebaseAuth.instance
          .signInWithCredential(twitterAuthCredential);
    }

    return userCredential;
  }
}
