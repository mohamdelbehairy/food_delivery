import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../features/home/presentation/views/home_view.dart';

Future<Object?> showAlertWidget(BuildContext context) {
  showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) => Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: 480,
                width: MediaQuery.sizeOf(context).width - 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 32),
                    CustomSvg(
                        svgModel: SvgModel(image: Assets.imagesLoginSuccess)),
                    const SizedBox(height: 24),
                    Text('Sign In\n Successful',
                        textAlign: TextAlign.center,
                        style: Styles.styleBoldUrbainst24),
                    const SizedBox(height: 16),
                    Text(
                        'Please wait...\n You will be directed to the homepage soon.',
                        textAlign: TextAlign.center,
                        style: Styles.styleMediumUrbainst16),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                          backgroundColor: const Color(0xffF4F4F4),
                          strokeWidth: 5),
                    )
                  ],
                ),
              ),
            ),
          ));
  Future.delayed(const Duration(seconds: 3), () {
    // ignore: use_build_context_synchronously
    Navigation.go(context, const HomeView());
  });
  return Future.value();
}
