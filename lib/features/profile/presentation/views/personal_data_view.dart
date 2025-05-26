import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/app_bar_model.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../../core/utils/services/firebase_firestore_service.dart';
import '../../../../core/utils/services/firebase_storage_service.dart';
import '../../../../core/utils/services/image_picker_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/model/user_data_model.dart';
import '../manager/personal_data/personal_data_bloc.dart';
import 'widgets/personal_data_view_body.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key, required this.userDataModel});
  final UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PersonalDataBloc(
            Helper.getIt.get<FirebaseFirestoreService>(),
            Helper.getIt.get<FirebaseStorageService>(),
            ImagePickerService())
          ..initTextField(context, userDataModel),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: customAppBar(
                AppBarModel(title: "Personal Data", context: context)),
            body: PersonalDataViewBody(imageUrl: userDataModel.userImage)));
  }
}
