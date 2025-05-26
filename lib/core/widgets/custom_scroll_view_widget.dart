import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatelessWidget {
  const CustomScrollViewWidget(
      {super.key, required this.child, this.formKey, this.horizontal});
  final Widget child;
  final Key? formKey;
  final double? horizontal;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontal ?? 24),
            child: Form(key: formKey, child: child),
          ),
        )
      ],
    );
  }
}
