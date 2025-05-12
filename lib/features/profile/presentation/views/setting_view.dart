import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../../core/utils/services/url_launcher_service.dart';
import '../manager/setting/setting_bloc.dart';
import '../../../../core/widgets/custom_profile_app_bar.dart';
import 'widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingBloc(Helper.getIt.get<UrlLauncherService>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customProfileAppBar(context, title: "Settings"),
        body: SettingViewBody(),
      ),
    );
  }
}
