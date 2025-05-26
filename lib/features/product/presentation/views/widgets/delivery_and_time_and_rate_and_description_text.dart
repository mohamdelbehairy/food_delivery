import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class DleiveryAndTimeAndRateDescriptionText extends StatelessWidget {
  const DleiveryAndTimeAndRateDescriptionText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Styles.regular14.copyWith(color: const Color(0xff878787)));
  }
}
