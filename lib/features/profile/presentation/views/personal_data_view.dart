import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../user_data/data/model/user_data_model.dart';
import '../../../user_data/data/repo/user_data_repo_impl.dart';
import '../../data/repo/profile_repo_impl.dart';
import '../manager/personal_data/personal_data_bloc.dart';
import 'widgets/personal_data_app_bar.dart';
import 'widgets/personal_data_view_body.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key, required this.userDataModel});
  final UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PersonalDataBloc(
            ProfileRepoImpl(), Helper.getIt.get<UserDataRepoImpl>())
          ..initTextField(userDataModel),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: personalDataAppBar(context),
            body: PersonalDataViewBody(imageUrl: userDataModel.userImage)));
  }
}
