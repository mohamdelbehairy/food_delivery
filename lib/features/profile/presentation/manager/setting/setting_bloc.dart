import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_arrow_back_widget.dart';
import '../../../data/model/profile_item_model.dart';
import '../../views/widgets/setting_language_trailing.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingEvent>((event, emit) {});
  }

  List<ProfileItemModel> profileItems() {
    return [
      ProfileItemModel(title: "Push Notification", isSwitch: false),
      ProfileItemModel(title: "Location", isSwitch: true),
      ProfileItemModel(
          title: "Language", trailing: const SettingLanguageTrailing())
    ];
  }

  List<ProfileItemModel> otherItems() {
    return [
      ProfileItemModel(
          title: "About Ticketis", trailing: CustomArrowBackWidget(right: 20)),
      ProfileItemModel(
          title: "Privacy Policy", trailing: CustomArrowBackWidget(right: 20)),
      ProfileItemModel(
          title: "Terms and Conditions",
          trailing: CustomArrowBackWidget(right: 20))
    ];
  }
}
