import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/auth/auth_bloc.dart';
import '../../manager/auth/auth_state.dart';
import 'auth_provider_item.dart';

class AuthProviderListView extends StatelessWidget {
  const AuthProviderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: context
              .read<AuthBloc>()
              .providerList()
              .map((e) => AuthProviderItem(providerItemModel: e))
              .toList(),
        );
      },
    );
  }
}
