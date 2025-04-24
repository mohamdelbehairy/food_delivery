import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';

import '../../../data/model/provider_item_model.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvents>((event, emit) {});
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
