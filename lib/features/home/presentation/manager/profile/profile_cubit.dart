import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';

import '../../../data/model/profile_item_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  List<ProfileItemModel> profileItems() {
    return [
      ProfileItemModel(
          title: 'Personal Data',
          leading: Assets.imagesPersonalData,
          onTap: () {}),
      ProfileItemModel(
          title: 'Settings', leading: Assets.imagesSettings, onTap: () {}),
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
}
