import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/personal_data/personal_data_bloc.dart';
import 'profile_image_widget.dart';

class PersonalDataImage extends StatelessWidget {
  const PersonalDataImage({super.key});

  @override
  Widget build(BuildContext context) {
    final image = context.read<PersonalDataBloc>();
    return ProfileImageWidget(
        child: image.image == null
            ? null
            : Image.file(image.image!,fit: BoxFit.fill));
  }
}
