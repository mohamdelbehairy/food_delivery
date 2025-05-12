import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_profile_app_bar.dart';
import '../manager/general/general_cubit.dart';
import 'widgets/general_view_body.dart';

class GeneralView extends StatelessWidget {
  const GeneralView({super.key});

  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customProfileAppBar(context, title: "General"),
        body: const GeneralViewBody(),
      ),
    );
  }
}
