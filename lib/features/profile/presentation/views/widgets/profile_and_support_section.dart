import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/profile/profile_cubit.dart';
import 'profile_title_and_list_view_section.dart';

class ProfileAndSupportSection extends StatelessWidget {
  const ProfileAndSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.read<ProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PofileTitleAndListViewSection(
            title: "Profile", items: profile.profileItems()),
        const SizedBox(height: 16),
        PofileTitleAndListViewSection(
            title: "Support", items: profile.supportItems()),
      ],
    );
  }
}
