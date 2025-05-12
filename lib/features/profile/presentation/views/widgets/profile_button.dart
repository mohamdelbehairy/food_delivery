import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/button_model.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'profile_sign_out_show_dialog.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonModel: ButtonModel(
      onTap: () => showDialog(
          context: context, builder: (context) => ProfileSignOutShowDialog()),
      borderColor: const Color(0xffD6D6D6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvg(svgModel: SvgModel(image: Assets.imagesLogout)),
          const SizedBox(width: 12),
          Text("Sign Out",
              style: Styles.semiBold14.copyWith(color: const Color(0xffF14141)))
        ],
      ),
    ));
  }
}
