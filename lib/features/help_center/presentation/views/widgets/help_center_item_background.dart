import 'package:flutter/material.dart';

class HelpCenterItemBackground extends StatelessWidget {
  const HelpCenterItemBackground({super.key, this.onTap, required this.child});
  final Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 84,
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
        child: child,
      ),
    );
  }
}
