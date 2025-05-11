import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/constants.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:food_delivery/core/utils/services/url_launcher_service.dart';

import '../../../../../core/widgets/custom_arrow_back_widget.dart';
import '../../../data/model/profile_item_model.dart';
import '../../views/widgets/setting_language_trailing.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final UrlLauncherService _launcherService;
  SettingBloc(this._launcherService) : super(SettingInitial()) {
    on<SettingEvent>((event, emit) {
      if (event is PushNotificationEvent) {
        _pushNotification = event.value;
        emit(ChangeSwitchState());
      }

      if (event is LocationEvent) {
        _location = event.value;
        emit(ChangeSwitchState());
      }
    });
  }

  bool _pushNotification = false;
  bool _location = true;

  List<ProfileItemModel> profileItems(BuildContext context) {
    return [
      ProfileItemModel(
          title: "Push Notification",
          isSwitch: _pushNotification,
          onChanged: (value) => add(PushNotificationEvent(value))),
      ProfileItemModel(
          title: "Location",
          isSwitch: _location,
          onChanged: (value) => add(LocationEvent(value))),
      ProfileItemModel(
          title: "Language",
          trailing: const SettingLanguageTrailing(),
          onTap: () => Helper.customSnackBar(context,
              message: "This Feature is coming soon."))
    ];
  }

  List<ProfileItemModel> otherItems(BuildContext context) {
    return [
      ProfileItemModel(
          title: "About Ticketis",
          trailing: CustomArrowBackWidget(right: 20),
          onTap: () => Helper.customSnackBar(context,
              message: "This Feature is coming soon.")),
      ProfileItemModel(
          title: "Privacy Policy",
          trailing: CustomArrowBackWidget(right: 20),
          onTap: () => _launcherService.openUrl(Constants.privacyPolicyUrl)),
      ProfileItemModel(
          title: "Terms and Conditions",
          trailing: CustomArrowBackWidget(right: 20),
          onTap: () => _launcherService.openUrl(Constants.termsAndConditionUrl))
    ];
  }
}
