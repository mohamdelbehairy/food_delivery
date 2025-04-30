import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_scroll_view_widget.dart';
import 'personal_data_button.dart';
import 'personal_data_image.dart';
import 'personal_data_list_view.dart';

class PersonalDataViewBody extends StatelessWidget {
  const PersonalDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollViewWidget(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const PersonalDataImage(),
          const SizedBox(height: 24),
          const PersonalDataListView(),
          const SizedBox(height: 32),
          const PersonalDataButton(),
        ],
      ),
    );
  }
}
