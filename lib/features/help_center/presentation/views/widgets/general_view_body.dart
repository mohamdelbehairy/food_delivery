import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/general/general_cubit.dart';
import 'general_list_view.dart';

class GeneralViewBody extends StatelessWidget {
  const GeneralViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final general = context.read<GeneralCubit>();
    return BlocBuilder<GeneralCubit, GeneralState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GeneralListView(list: general.generalItem),
        );
      },
    );
  }
}
