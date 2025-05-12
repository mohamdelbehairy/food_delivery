import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/button_model.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/personal_data/personal_data_bloc.dart';

class PersonalDataButton extends StatelessWidget {
  const PersonalDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    final personalData = context.read<PersonalDataBloc>();
    return CustomButton(
        buttonModel: ButtonModel(
      buttonName: "Save",
      backgroundColor: AppColors.primaryColor,
      isLoading: personalData.isLoading,
      onTap: () => personalData.add(SavePersonalDataEvent()),
    ));
  }
}
