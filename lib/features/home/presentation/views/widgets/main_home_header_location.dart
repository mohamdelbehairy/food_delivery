import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/custom_svg.dart';
import '../../../../../core/utils/styles.dart';

class MainHomeHeaderLocation extends StatelessWidget {
  const MainHomeHeaderLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 24,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Your Location", style: Styles.regular14),
                const SizedBox(width: 8),
                Transform.rotate(
                    angle: -90 * 3.14 / 180,
                    child: Icon(Icons.arrow_back_ios_new,
                        size: 18, color: Colors.white))
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CustomSvg(svgModel: SvgModel(image: Assets.imagesLocation)),
                const SizedBox(width: 16),
                Text("New York City",
                    style: Styles.semiBold14.copyWith(color: Colors.white))
              ],
            ),
          ],
        )));
  }
}