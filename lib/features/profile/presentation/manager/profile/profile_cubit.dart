import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../../user_data/data/repo/user_data_repo.dart';
import '../../../data/model/profile_item_model.dart';
import '../../../../user_data/data/model/user_data_model.dart';
import '../../views/personal_data_view.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._userDataRepo) : super(ProfileInitial());
  final UserDataRepo _userDataRepo;

  List<ProfileItemModel> profileItems(BuildContext context) {
    return [
      ProfileItemModel(
          title: 'Personal Data',
          leading: Assets.imagesPersonalData,
          onTap: () => Navigation.push(
              context, PersonalDataView(userDataModel: userDataModel!))),
      ProfileItemModel(
          title: 'Settings',
          leading: Assets.imagesSettings,
          onTap: () {
            log("user data: ${userDataModel?.userName}");
          }),
      ProfileItemModel(
          title: 'Extra Card', leading: Assets.imagesExtraCard, onTap: () {}),
    ];
  }

  List<ProfileItemModel> supportItems() {
    return [
      ProfileItemModel(
          title: 'Help Center', leading: Assets.imagesHelpCenter, onTap: () {}),
      ProfileItemModel(
          title: 'Request Account Deletion',
          leading: Assets.imagesDeleteAccount,
          onTap: () {}),
      ProfileItemModel(
          title: 'Add another account',
          leading: Assets.imagesAddAnotherAccount,
          onTap: () {}),
    ];
  }

  UserDataModel? userDataModel;
  void getUserData() {
    _userDataRepo.getUserData((snapshot) {
      if (snapshot.docs.isEmpty) return;

      List<UserDataModel> users = snapshot.docs
          .map((docs) => UserDataModel.fromJson(docs.data()))
          .toList();

      final user = users.firstWhere(
          (elemnt) => elemnt.userID == FirebaseAuth.instance.currentUser!.uid);
      userDataModel = user;
      emit(GetUserDataSuccess(userDataModel: user));
    });
  }
}
