import 'package:flutter/material.dart';

import '../../../../../core/model/button_model.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class PersonalDataButton extends StatelessWidget {
  const PersonalDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonModel: ButtonModel(
            buttonName: "Save", color: AppColors.primaryColor, onTap: () {}));
  }
}
