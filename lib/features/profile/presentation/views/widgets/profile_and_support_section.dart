import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/home/home_bloc.dart';
import 'profile_title_and_list_view_section.dart';

class ProfileAndSupportSection extends StatelessWidget {
  const ProfileAndSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.read<HomeBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PofileTitleAndListViewSection(
            title: "Profile", items: profile.profileItems(context)),
        const SizedBox(height: 16),
        PofileTitleAndListViewSection(
            title: "Support", items: profile.supportItems()),
      ],
    );
  }
}
