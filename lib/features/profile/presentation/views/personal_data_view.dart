import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/personal_data/personal_data_bloc.dart';
import 'widgets/personal_data_app_bar.dart';
import 'widgets/personal_data_view_body.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalDataBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: personalDataAppBar(context),
        body: const PersonalDataViewBody(),
      ),
    );
  }
}
