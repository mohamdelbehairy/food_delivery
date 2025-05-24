import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/constants.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../../../core/utils/services/firebase_auth_service.dart';
import '../../../../../core/utils/services/shared_pref_service.dart';
import '../../../../../core/utils/services/url_launcher_service.dart';
import '../../../../user_data/data/model/user_data_model.dart';
import '../../../../user_data/data/repo/user_data_repo.dart';
import '../../../data/model/provider_item_model.dart';
import '../../../../../core/model/text_field_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // final AuthRepo _authRepo;
  final FirebaseAuthService _firebaseAuthService;
  final UserDataRepo _userDataRepo;
  final SharedPrefService _sharedPrefService;
  final UrlLauncherService _launcherService = Helper.getIt.get();
  AuthBloc(
      this._firebaseAuthService, this._userDataRepo, this._sharedPrefService)
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // email auth events
      if (event is LoginVisbleEvent) {
        _isVisibleLogin = !_isVisibleLogin;
        emit(ChangeVisble());
      }

      if (event is RegisterVisbleEvent) {
        _isVisibleRegister = !_isVisibleRegister;
        emit(ChangeVisble());
      }

      if (event is PrivacyPolicyAndTermsEvent) {
        privacyPolicy = !privacyPolicy;
        emit(ChangePrivacyPolicy());
      }

      if (event is LoginButtonEvent) {
        if (loginKey.currentState!.validate()) {
          loginKey.currentState!.save();
          isLoading = true;
          emit(AuthLoading());
          await _firebaseAuthService
              .loginWithEmail(
                  _loginEmailController.text, _loginPasswordController.text)
              .then((value) {
            isLoading = false;
            emit(LoginSuccess());
          }).catchError((error) {
            log("error from login email: $error");

            if (error.code == "invalid-credential") {
              isLoading = false;
              emit(AuthFailure(errorMessage: "invalid-credential"));
            } else {
              isLoading = false;
              emit(AuthFailure(errorMessage: error.code));
            }
          });
        }
      }

      if (event is RegisterButtonEvent) {
        if (registerKey.currentState!.validate()) {
          registerKey.currentState!.save();
          if (privacyPolicy) {
            isLoading = true;
            emit(AuthLoading());
            await _firebaseAuthService
                .createUserWithEmail(_registerEmailController.text,
                    _registerPasswordController.text)
                .then((value) async {
              await _userDataRepo.addUserData(UserDataModel(
                  userName: _registerUserNameController.text,
                  userID: FirebaseAuth.instance.currentUser!.uid,
                  userEmail: _registerEmailController.text));
              isLoading = false;
              emit(RegisterSuccess());
            }).catchError((error) {
              log("error from register email: $error");

              if (error.code == "email-already-in-use") {
                isLoading = false;
                emit(AuthFailure(errorMessage: "email-already-in-use"));
              } else {
                isLoading = false;
                emit(AuthFailure(errorMessage: error.code));
              }
            });
          }
        }
      }

      // social auth events
      if (event is LoginGoogleEvent) {
        emit(AuthLoading());
        await _firebaseAuthService.loginUsingGoogle().then((value) async {
          if (value != null) {
            if (!await _userDataRepo.isUserExist(value.user!.uid)) {
              await _userDataRepo.addUserData(UserDataModel(
                  userName: value.user?.displayName ?? "",
                  userID: value.user?.uid ?? "",
                  userEmail: value.user?.email ?? "",
                  userImage: value.user?.photoURL ?? ""));
            }
            emit(LoginSuccess());
          } else {
            log("please try again and select google account");
            emit(AuthFailure(
                errorMessage: "please try again and select google account"));
          }
        }).catchError((error) {
          log("error from login google: $error");
          if (error.code == "account-exists-with-different-credential") {
            emit(AuthFailure(
                errorMessage: "account-exists-with-different-credential"));
          } else {
            emit(AuthFailure(errorMessage: error.code));
          }
        });
      }

      if (event is LoginFacebookEvent) {
        emit(AuthLoading());
        await _firebaseAuthService.loginUsingFacebook().then((value) async {
          if (value != null) {
            if (!await _userDataRepo.isUserExist(value.user!.uid)) {
              await _userDataRepo.addUserData(UserDataModel(
                  userName: value.user?.displayName ?? "",
                  userID: value.user?.uid ?? "",
                  userEmail: value.user?.email ?? "",
                  userImage: value.user?.photoURL ?? ""));
            }

            emit(LoginSuccess());
          } else {
            log("please try again and select facebook account");
            emit(AuthFailure(
                errorMessage: "please try again and select facebook account"));
          }
        }).catchError((error) {
          log("error from login facebook: $error");
          if (error.code == "account-exists-with-different-credential") {
            emit(AuthFailure(
                errorMessage: "account-exists-with-different-credential"));
          } else {
            emit(AuthFailure(errorMessage: error.code));
          }
        });
      }

      if (event is LoginTwitterEvent) {
        emit(AuthLoading());
        await _firebaseAuthService.loginUsingTwitter().then((value) async {
          if (value != null) {
            if (!await _userDataRepo.isUserExist(value.user!.uid)) {
              await _userDataRepo.addUserData(UserDataModel(
                  userName: value.user?.displayName ?? "",
                  userID: value.user?.uid ?? "",
                  userEmail: value.user?.email ?? "",
                  userImage: value.user?.photoURL ?? ""));
            }
            emit(LoginSuccess());
          } else {
            log("please try again and select twitter account");
            emit(AuthFailure(
                errorMessage: "please try again and select twitter account"));
          }
        }).catchError((error) {
          log("error from login twitter: $error");
          if (error.code == "account-exists-with-different-credential") {
            emit(AuthFailure(
                errorMessage: "account-exists-with-different-credential"));
          } else {
            emit(AuthFailure(errorMessage: error.code));
          }
        });
      }

      // forgot password events
      if (event is ForgotPasswordEvent) {
        if (forgotPasswordKey.currentState!.validate()) {
          forgotPasswordKey.currentState!.save();
          isLoading = true;
          emit(AuthLoading());
          await _firebaseAuthService
              .forgotPassword(forgotPasswordController.text)
              .then((value) {
            isLoading = false;
            emit(ForgotPasswordSuccess());
          }).catchError((error) {
            log("error from forgot password: $error");
            isLoading = false;
            emit(AuthFailure(errorMessage: error.code));
          });
        }
      }

      // logout events
      if (event is LogoutEvent) {
        emit(AuthLoading());
        await _firebaseAuthService.logOut().then((value) async {
          await _sharedPrefService.remove(Constants.userID);
          emit(LogoutSuccess());
        }).catchError((error) {
          log("error from logout: $error");
          emit(AuthFailure(errorMessage: error.code));
        });
      }

      // privacy policy and terms and condition events
      if (event is PrivacyPolicyEvent) {
        await _launcherService.openUrl(Constants.privacyPolicyUrl);
      }

      if (event is TermsAndConditionsEvent) {
        await _launcherService.openUrl(Constants.termsAndConditionUrl);
      }
    });
  }

  bool _isVisibleLogin = false;
  bool _isVisibleRegister = false;
  bool privacyPolicy = false;
  bool isLoading = false;

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();

  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerUserNameController =
      TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();

  final TextEditingController forgotPasswordController =
      TextEditingController();

  List<TextFieldModel> loginTextFieldList() {
    return [
      TextFieldModel(
          header: "Email Address",
          hintText: "Enter Email",
          controller: _loginEmailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter your email";
            }
            if (value.isNotEmpty && !EmailValidator.validate(value)) {
              return "Please enter a valid email";
            }
            return null;
          }),
      TextFieldModel(
          header: "Password",
          hintText: "Password",
          obscureText: !_isVisibleLogin,
          controller: _loginPasswordController,
          suffixIcon: IconButton(
              onPressed: () => add(LoginVisbleEvent()),
              icon: Icon(
                  _isVisibleLogin
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Color(0xffD6D6D6),
                  size: 20)),
          validator: (value) {
            if (_loginEmailController.text.isEmpty ||
                !EmailValidator.validate(_loginEmailController.text)) {
              return null;
            }
            if (value!.isEmpty) {
              return "Please enter your password";
            }
            if (value.isNotEmpty && value.length < 8) {
              return "Password must be at least 8 characters";
            }
            return null;
          })
    ];
  }

  List<TextFieldModel> registerTextFieldList() {
    return [
      TextFieldModel(
          header: "Email Address",
          hintText: "Enter Email",
          controller: _registerEmailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter your email";
            }
            if (value.isNotEmpty && !EmailValidator.validate(value)) {
              return "Please enter a valid email";
            }
            return null;
          }),
      TextFieldModel(
          header: "User Name",
          hintText: "Enter User Name",
          controller: _registerUserNameController,
          validator: (value) {
            if (_registerEmailController.text.isEmpty ||
                !EmailValidator.validate(_registerEmailController.text)) {
              return null;
            }
            if (value!.isEmpty) {
              return "Please enter your name";
            }
            return null;
          }),
      TextFieldModel(
          header: "Password",
          hintText: "Password",
          obscureText: !_isVisibleRegister,
          controller: _registerPasswordController,
          suffixIcon: IconButton(
              onPressed: () => add(RegisterVisbleEvent()),
              icon: Icon(
                  _isVisibleRegister
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Color(0xffD6D6D6),
                  size: 20)),
          validator: (value) {
            if (_registerEmailController.text.isEmpty ||
                !EmailValidator.validate(_registerEmailController.text) ||
                _registerUserNameController.text.isEmpty) {
              return null;
            }
            if (value!.isEmpty) {
              return "Please enter your password";
            }
            if (value.isNotEmpty && value.length < 8) {
              return "Password must be at least 8 characters";
            }
            return null;
          })
    ];
  }

  List<ProviderItemModel> providerList() {
    return [
      ProviderItemModel(
          image: Assets.imagesGoogle, onTap: () => add(LoginGoogleEvent())),
      ProviderItemModel(
          image: Assets.imagesFacebook, onTap: () => add(LoginFacebookEvent())),
      ProviderItemModel(
          height: 28,
          image: Assets.imagesTwitter,
          onTap: () => add(LoginTwitterEvent()))
    ];
  }

  void loginDispose(BuildContext context, {bool? isLogin}) async {
    Helper.showAlertWidget(context);

    final isFirstTime = _sharedPrefService.getString(Constants.isFirstTime);
    if (isFirstTime == null || isFirstTime.isEmpty) {
      await _sharedPrefService.setString(
          key: Constants.isFirstTime, value: "true");
    }
    await _sharedPrefService.setString(
        key: Constants.userID, value: FirebaseAuth.instance.currentUser!.uid);
    if (isLogin == true) {
      _loginEmailController.clear();
      _loginPasswordController.clear();
    }
  }

  @override
  Future<void> close() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _registerEmailController.dispose();
    _registerUserNameController.dispose();
    _registerPasswordController.dispose();
    forgotPasswordController.dispose();
    return super.close();
  }
}
