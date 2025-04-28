import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_scroll_view_widget.dart';
import 'profile_and_support_section.dart';
import 'profile_button.dart';
import 'profile_divider.dart';
import 'profile_user_data.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollViewWidget(
        child: Column(
      children: [
        const ProfileUserData(),
        const SizedBox(height: 12),
        const ProfileDivider(),
        const SizedBox(height: 12),
        const ProfileAndSupportSection(),
        const SizedBox(height: 16),
        const ProfileButton(),
      ],
    ));
  }
}
