import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/app_bar_model.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/help_center/help_center_cubit.dart';
import 'widgets/help_center_view_body.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HelpCenterCubit(),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: customAppBar(
                AppBarModel(title: "Help Center", context: context)),
            body: const HelpCenterViewBody()));
  }
}
