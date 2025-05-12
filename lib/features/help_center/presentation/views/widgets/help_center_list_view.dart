import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/help_center/help_center_cubit.dart';
import 'help_center_item.dart';

class HelpCenterListView extends StatelessWidget {
  const HelpCenterListView({super.key});

  @override
  Widget build(BuildContext context) {
    final helpCenter = context.read<HelpCenterCubit>();
    return BlocBuilder<HelpCenterCubit, HelpCenterState>(
      builder: (context, state) {
        return Container(
          color: const Color(0xffF9F9F9).withValues(alpha: .4),
          child: Column(
            spacing: 16,
            children: helpCenter.helpCenterItem
                .map((e) => HelpCenterItem(helpCenterModel: e))
                .toList(),
          ),
        );
      },
    );
  }
}
