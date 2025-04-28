import 'package:flutter/material.dart';

class AuthCustomScrollView extends StatelessWidget {
  const AuthCustomScrollView({super.key, required this.child, this.formKey});
  final Widget child;
  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(key: formKey, child: child),
          ),
        )
      ],
    );
  }
}
