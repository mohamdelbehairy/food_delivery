import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';

import '../../../data/model/provider_item_model.dart';
import '../../../data/model/text_field_model.dart';
import '../../../data/repo/auth_repo.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<AuthEvents>((event, emit) async {
      // email auth events
      if (event is LoginVisbleEvent) {
        _isVisibleLogin = !_isVisibleLogin;
        emit(ChangeVisble());
      }

      if (event is RegisterVisbleEvent) {
        _isVisibleRegister = !_isVisibleRegister;
        emit(ChangeVisble());
      }

      if (event is PrivacyPolicyEvent) {
        privacyPolicy = !privacyPolicy;
        emit(ChangePrivacyPolicy());
      }

      if (event is LoginButtonEvent) {
        if (loginKey.currentState!.validate()) {
          loginKey.currentState!.save();
          emit(AuthLoading());
          await _authRepo
              .loginEmail(
                  _loginEmailController.text, _loginPasswordController.text)
              .then((value) {
            emit(LoginSuccess());
          }).catchError((error) {
            log("error from login email: $error");

            if (error.code == "invalid-credential") {
              emit(AuthFailure(errorMessage: "invalid-credential"));
            } else {
              emit(AuthFailure(errorMessage: error.code));
            }
          });
        }
      }

      if (event is RegisterButtonEvent) {
        if (registerKey.currentState!.validate()) {
          registerKey.currentState!.save();
          if (privacyPolicy) {
            emit(AuthLoading());
            await _authRepo
                .registerEmail(_registerEmailController.text,
                    _registerPasswordController.text)
                .then((value) {
              emit(RegisterSuccess());
            }).catchError((error) {
              log("error from register email: $error");

              if (error.code == "email-already-in-use") {
                emit(AuthFailure(errorMessage: "email-already-in-use"));
              } else {
                emit(AuthFailure(errorMessage: error.code));
              }
            });
          }
        }
      }

      // social auth events
      if (event is LoginGoogleEvent) {
        emit(AuthLoading());
        await _authRepo.loginUsingGoogle().then((value) {
          if (value != null) {
            emit(LoginSuccess());
          } else {
            log("please try again and select google account");
            emit(AuthFailure(
                errorMessage: "please try again and select google account"));
          }
        }).catchError((error) {
          log("error from login google: $error");
          emit(AuthFailure(errorMessage: error.code));
        });
      }

      if (event is LoginTwitterEvent) {
        emit(AuthLoading());
        await _authRepo.loginUsingTwitter().then((value) {
          if (value != null) {
            emit(LoginSuccess());
          } else {
            log("please try again and select twitter account");
            emit(AuthFailure(
                errorMessage: "please try again and select twitter account"));
          }
        }).catchError((error) {
          log("error from login twitter: $error");
          emit(AuthFailure(errorMessage: error.code));
        });
      }

      if (event is LoginFacebookEvent) {
        emit(AuthLoading());
        await _authRepo.loginUsingFacebook().then((value) {
          if (value != null) {
            log("image: ${value.user!.providerData}");
            emit(LoginSuccess());
          } else {
            log("please try again and select facebook account");
            emit(AuthFailure(
                errorMessage: "please try again and select facebook account"));
          }
        }).catchError((error) {
          log("error from login facebook: $error");
          emit(AuthFailure(errorMessage: error.code));
        });
      }
    });
  }

  bool _isVisibleLogin = false;
  bool _isVisibleRegister = false;
  bool privacyPolicy = false;

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerUserNameController =
      TextEditingController();
  final TextEditingController _registerPasswordController =
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
}
