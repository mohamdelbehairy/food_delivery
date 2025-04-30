import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../manager/gender/gender_cubit.dart';
import 'gender_bottom_sheet_button.dart';
import 'gender_bottom_sheet_divider.dart';
import 'gender_bottom_sheet_list_view.dart';

class GenderBottomSheet extends StatelessWidget {
  const GenderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            GenderBottomSheetDivider(),
            const SizedBox(height: 16),
            Text("Select Gender", style: Styles.semiBold16),
            const SizedBox(height: 28),
            const GenderBottomSheetListView(),
            const SizedBox(height: 32),
            const GenderBottomSheetButton(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

