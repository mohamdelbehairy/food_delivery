import 'package:flutter/material.dart';

import 'pick_image_widget.dart';
import 'profile_image_widget.dart';

class PersonalDataImage extends StatelessWidget {
  const PersonalDataImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.1, 1),
      children: [
        const ProfileImageWidget(),
        const PickImageWidget(),
      ],
    );
  }
}
