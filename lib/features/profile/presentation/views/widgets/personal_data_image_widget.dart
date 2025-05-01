import 'package:flutter/material.dart';

import 'personal_data_image.dart';
import 'pick_image_widget.dart';

class PersonalDataImageWidget extends StatelessWidget {
  const PersonalDataImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.1, 1),
      children: [
        const PersonalDataImage(),
        const PickImageWidget(),
      ],
    );
  }
}
