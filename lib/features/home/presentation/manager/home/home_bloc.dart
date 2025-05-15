import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../../profile/data/model/gender_item_model.dart';
import '../../../../profile/data/model/profile_item_model.dart';
import '../../../../help_center/presentation/views/help_center_view.dart';
import '../../../../profile/presentation/views/personal_data_view.dart';
import '../../../../profile/presentation/views/setting_view.dart';
import '../../../../profile/presentation/views/widgets/delete_account_show_dialog.dart';
import '../../../../user_data/data/model/user_data_model.dart';
import '../../../../user_data/data/repo/user_data_repo.dart';
import '../../../data/model/bottom_nav_model.dart';
import '../../../../profile/presentation/views/profile_view.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserDataRepo _userDataRepo;
  HomeBloc(this._userDataRepo) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is ChangeBottomNavEvent) {
        if (event.index == currentIndex) return;
        currentIndex = event.index;
        emit(ChangeBottomNavState());
      }

      if (event is GenderEvent) {
        if (event.index == genderCurrentIndex) return;
        genderCurrentIndex = event.index;
        emit(ChangeGenderIndex());
      }
    });

    on<UserDataUpdatedEvent>((event, emit) {
      userDataModel = event.userDataModel;
      emit(GetUserDataSuccess());
    });

    _userSub = _userDataRepo.getUserData((snapshot) {
      if (snapshot.docs.isEmpty) return;

      final users = snapshot.docs
          .map((doc) => UserDataModel.fromJson(doc.data()))
          .toList();

      final user = users.firstWhere(
          (e) => e.userID == FirebaseAuth.instance.currentUser!.uid);

      if (user.userID.isNotEmpty) {
        add(UserDataUpdatedEvent(user));
      }
    });
  }

  late StreamSubscription _userSub;
  UserDataModel? userDataModel;
  int currentIndex = 0;

  List<BottomNavModel> bottomNavItems = [
    BottomNavModel(image: Assets.imagesHome, index: 0, lable: "Home"),
    BottomNavModel(image: Assets.imagesCard, index: 1, lable: "Card"),
    BottomNavModel(image: Assets.imagesChat, index: 2, lable: "Chat"),
    BottomNavModel(image: Assets.imagesProfile, index: 3, lable: "Profile"),
  ];

  List<Widget> views = const [
    Scaffold(),
    Scaffold(),
    Scaffold(),
    ProfileView(),
  ];

  // profile build items
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
          onTap: () => Navigation.push(context, const SettingView())),
      ProfileItemModel(
          title: 'Extra Card',
          leading: Assets.imagesExtraCard,
          onTap: () => Helper.customSnackBar(context,
              message: "This Feature is coming soon.")),
    ];
  }

  List<ProfileItemModel> supportItems(BuildContext context) {
    return [
      ProfileItemModel(
          title: 'Help Center',
          leading: Assets.imagesHelpCenter,
          onTap: () => Navigation.push(context, const HelpCenterView())),
      ProfileItemModel(
          title: 'Delete Account',
          leading: Assets.imagesDeleteAccount,
          onTap: () => showDialog(
              context: context,
              builder: (context) => DeleteAccountShowDialog())),
      ProfileItemModel(
          title: 'Add another account',
          leading: Assets.imagesAddAnotherAccount,
          onTap: () => Helper.customSnackBar(context,
              message: "This Feature is coming soon.")),
    ];
  }

  // gender item
  int genderCurrentIndex = -1;

  List<GenderItemModel> genderList = [
    GenderItemModel(icon: Icons.male, title: "Male"),
    GenderItemModel(icon: Icons.female, title: "Female"),
  ];

  @override
  Future<void> close() {
    _userSub.cancel();
    return super.close();
  }
}


