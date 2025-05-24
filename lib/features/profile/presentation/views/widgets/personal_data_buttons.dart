import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/personal_data/personal_data_bloc.dart';

class PersonalDataButtons extends StatelessWidget {
  const PersonalDataButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final personalData = context.read<PersonalDataBloc>();
    return Column(
      spacing: 16,
      children: personalData
          .buttonList()
          .map((e) => CustomButton(buttonModel: e))
          .toList(),
    );
  }
}
