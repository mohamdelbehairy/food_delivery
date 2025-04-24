import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';

import '../../../data/model/provider_item_model.dart';
import '../../../data/model/text_field_model.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvents>((event, emit) {
      if (event is VisbleEvent) {
        isVisible = !isVisible;
        emit(ChangeVisble());
      }

      if (event is LoginButtonEvent) {
        if (key.currentState!.validate()) {
          key.currentState!.save();
          log("login");
        }
      }
    });
  }

  bool isVisible = false;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  List<TextFieldModel> loginTextFieldList() {
    return [
      TextFieldModel(
          header: "Email Address",
          hintText: "Enter Email",
          controller: loginEmailController,
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
          obscureText: !isVisible,
          controller: loginPasswordController,
          suffixIcon: IconButton(
              onPressed: () => add(VisbleEvent()),
              icon: Icon(
                  isVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Color(0xffD6D6D6),
                  size: 20)),
          validator: (value) {
            if (loginEmailController.text.isEmpty ||
                !EmailValidator.validate(loginEmailController.text)) {
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
          image: Assets.imagesGoogle,
          onTap: () {
            log("google");
          }),
      ProviderItemModel(
          image: Assets.imagesFacebook,
          onTap: () {
            log("facebook");
          }),
      ProviderItemModel(
          height: 28,
          image: Assets.imagesTwitter,
          onTap: () {
            log("twitter");
          })
    ];
  }
}
