import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/gender/gender_cubit.dart';
import 'gender_bottom_sheet_item.dart';

class GenderBottomSheetListView extends StatelessWidget {
  const GenderBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    final gender = context.read<GenderCubit>();
    return BlocBuilder<GenderCubit, GenderState>(
      builder: (context, state) {
        return Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: gender.genderList
              .asMap()
              .entries
              .map((e) => GestureDetector(
                  onTap: () => gender.changeIndex(e.key),
                  child: GenderBottomSheetItem(
                      isActive: gender.currentIndex == e.key,
                      genderItemModel: e.value)))
              .toList(),
        );
      },
    );
  }
}
