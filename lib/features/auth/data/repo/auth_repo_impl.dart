import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_delivery/core/utils/helper.dart';
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
  Future<UserCredential?> loginUsingFacebook() async {
    final rawNonce = Helper.generateNonce();
    final nonce = Helper.sha256ofString(rawNonce);
    UserCredential? userCredential;
    final LoginResult loginResult =
        await FacebookAuth.instance.login(nonce: nonce);

    if (loginResult.status == LoginStatus.success) {
      OAuthCredential? facebookAuthCredential;
      if (Platform.isIOS) {
        final token = loginResult.accessToken as LimitedToken;
        facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce);
      } else {
        facebookAuthCredential = FacebookAuthProvider.credential(
            loginResult.accessToken!.tokenString);
      }

      userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
    }

    return userCredential;
  }

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

  @override
  Future<void> forgotPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
