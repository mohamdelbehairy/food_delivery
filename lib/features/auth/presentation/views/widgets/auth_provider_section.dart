import 'package:flutter/material.dart';

import 'auth_provider_list_view.dart';
import 'auth_signin_with_widget.dart';

class AuthProviderSection extends StatelessWidget {
  const AuthProviderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthSignInWithWidget(),
        const SizedBox(height: 20),
        const AuthProviderListView(),
      ],
    );
  }
}