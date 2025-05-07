import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/home/home_bloc.dart';
import 'gender_bottom_sheet_item.dart';

class GenderBottomSheetListView extends StatelessWidget {
  const GenderBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    final gender = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: gender.genderList
              .asMap()
              .entries
              .map((e) => GestureDetector(
                  onTap: () => gender.add(GenderEvent(index: e.key)),
                  child: GenderBottomSheetItem(
                      isActive: gender.genderCurrentIndex == e.key,
                      genderItemModel: e.value)))
              .toList(),
        );
      },
    );
  }
}
