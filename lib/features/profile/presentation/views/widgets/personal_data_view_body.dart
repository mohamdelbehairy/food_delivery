import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../../../core/widgets/custom_scroll_view_widget.dart';
import '../../manager/personal_data/personal_data_bloc.dart';
import 'personal_data_buttons.dart';
import 'personal_data_image_widget.dart';
import 'personal_data_list_view.dart';

class PersonalDataViewBody extends StatelessWidget {
  const PersonalDataViewBody({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final personalData = context.read<PersonalDataBloc>();
    return BlocConsumer<PersonalDataBloc, PersonalDataState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          Navigation.pop(context);
        }

        if (state is CancleChanges) {
          Helper.customSnackBar(context, message: "Cancle Changes");
        }
      },
      builder: (context, state) {
        return CustomScrollViewWidget(
          formKey: personalData.formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              PersonalDataImageWidget(imageUrl: imageUrl),
              const SizedBox(height: 24),
              const PersonalDataListView(),
              const SizedBox(height: 32),
              PersonalDataButtons(),
            ],
          ),
        );
      },
    );
  }
}
