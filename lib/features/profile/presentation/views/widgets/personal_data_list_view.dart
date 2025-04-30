import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/widgets/custom_text_field_section.dart';

import '../../manager/personal_data/personal_data_bloc.dart';

class PersonalDataListView extends StatelessWidget {
  const PersonalDataListView({super.key});

  @override
  Widget build(BuildContext context) {
    final personalData = context.read<PersonalDataBloc>();
    return BlocBuilder<PersonalDataBloc, PersonalDataState>(
      builder: (context, state) {
        return Column(
          spacing: 16,
          children: personalData.textFieldList
              .map((e) => CustomTextFieldSection(textFieldModel: e))
              .toList(),
        );
      },
    );
  }
}
