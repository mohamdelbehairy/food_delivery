import 'package:flutter/material.dart';

import '../../../data/model/background_item_model.dart';

class HelpCenterItemBackground extends StatelessWidget {
  const HelpCenterItemBackground(
      {super.key, required this.backgroundItemModel});

  final BackgroundItemModel backgroundItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: backgroundItemModel.onTap,
      child: Container(
          height: backgroundItemModel.height,
          margin: backgroundItemModel.margin,
          padding: backgroundItemModel.padding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withValues(alpha: .08),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: const Offset(0, 1))
            ],
          ),
          child: backgroundItemModel.child),
    );
  }
}
