import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/colors.dart';

import '../../manager/auth/auth_bloc.dart';
import '../../manager/auth/auth_event.dart';

class PrivacyPolicyBox extends StatelessWidget {
  const PrivacyPolicyBox({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return GestureDetector(
        onTap: () => auth.add(PrivacyPolicyAndTermsEvent()),
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: auth.privacyPolicy
                    ? AppColors.primaryColor
                    : Colors.transparent,
                border: Border.all(
                    color: auth.privacyPolicy
                        ? Colors.transparent
                        : const Color(0xff878787)),
                borderRadius: BorderRadius.circular(4)),
            child: auth.privacyPolicy
                ? Icon(Icons.done, color: Colors.white, size: 16)
                : null));
  }
}
