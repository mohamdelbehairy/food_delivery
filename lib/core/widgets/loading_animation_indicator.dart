import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimationIndicator extends StatelessWidget {
  const LoadingAnimationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.white, size: 28);
  }
}
