import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'delivery_and_time_and_rate_and_description_text.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: Styles.semiBold16),
        const SizedBox(height: 8),
        DleiveryAndTimeAndRateDescriptionText(text: description),
      ],
    );
  }
}
