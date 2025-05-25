import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("No Products here.", style: Styles.semiBold16));
  }
}