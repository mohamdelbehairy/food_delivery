import 'package:flutter/material.dart';

import 'privacy_policy_box.dart';
import 'privacy_policy_text.dart';

class AuthPrivacyPolicySection extends StatelessWidget {
  const AuthPrivacyPolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrivacyPolicyBox(),
          const SizedBox(width: 8),
          const PrivacyPolicyText(),
        ],
      ),
    );
  }
}


