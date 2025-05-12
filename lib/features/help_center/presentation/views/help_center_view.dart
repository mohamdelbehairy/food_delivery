import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/help_center/help_center_cubit.dart';
import '../../../profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'widgets/help_center_view_body.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpCenterCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customProfileAppBar(context, title: "Help Center"),
        body: const HelpCenterViewBody(),
      ),
    );
  }
}
