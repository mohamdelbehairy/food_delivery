import 'package:flutter/material.dart';

import 'personal_data_image.dart';
import 'pick_image_widget.dart';

class PersonalDataImageWidget extends StatelessWidget {
  const PersonalDataImageWidget({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.1, 1),
      children: [
        PersonalDataImage(imageUrl: imageUrl),
        const PickImageWidget(),
      ],
    );
  }
}
