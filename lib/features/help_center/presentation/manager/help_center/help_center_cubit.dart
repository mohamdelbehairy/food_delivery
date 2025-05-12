import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/features/help_center/data/model/help_center_model.dart';

part 'help_center_state.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit() : super(HelpCenterInitial());

  List<HelpCenterModel> helpCenterItem = [
    HelpCenterModel(
        title: "General",
        leading: Assets.imagesGeneral,
        subTitle: "Basic question about Restate",
        onTap: () {}),
    HelpCenterModel(
        title: "Sellers",
        leading: Assets.imagesSellers,
        subTitle: "All you need to know about selling your home to Restate",
        onTap: () {}),
    HelpCenterModel(
        title: "Buyers",
        leading: Assets.imagesBuyers,
        subTitle: "Everything you need to know about buying with Restate",
        onTap: () {}),
    HelpCenterModel(
        title: "Agents",
        leading: Assets.imagesAgents,
        subTitle: "How buying agents and listing agents can work with Restate",
        onTap: () {}),
  ];
}
