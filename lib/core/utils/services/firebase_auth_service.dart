import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import '../helper.dart';
import '../secret_key.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  Future<void> createUserWithEmail(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> loginWithEmail(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> forgotPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  Future<UserCredential?> loginUsingGoogle() async {
    UserCredential? userCredential;

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      userCredential = await _firebaseAuth.signInWithCredential(credential);
    }

    return userCredential;
  }

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

      userCredential =
          await _firebaseAuth.signInWithCredential(facebookAuthCredential);
    }

    return userCredential;
  }

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
