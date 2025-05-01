import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_scroll_view_widget.dart';
import '../../manager/personal_data/personal_data_bloc.dart';
import 'personal_data_button.dart';
import 'personal_data_image_widget.dart';
import 'personal_data_list_view.dart';

class PersonalDataViewBody extends StatelessWidget {
  const PersonalDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final personalData = context.read<PersonalDataBloc>();
    return BlocBuilder<PersonalDataBloc, PersonalDataState>(
      builder: (context, state) {
        return CustomScrollViewWidget(
          formKey: personalData.formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              PersonalDataImageWidget(),
              const SizedBox(height: 24),
              const PersonalDataListView(),
              const SizedBox(height: 32),
              const PersonalDataButton(),
            ],
          ),
        );
      },
    );
  }
}
