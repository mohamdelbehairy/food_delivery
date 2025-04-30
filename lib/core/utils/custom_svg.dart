import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/model/svg_model.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({super.key, required this.svgModel});
  final SvgModel svgModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: svgModel.onTap,
      child: SvgPicture.asset(svgModel.image,
          height: svgModel.height,
          width: svgModel.width,
          // ignore: deprecated_member_use
          color: svgModel.color),
    );
  }
}
