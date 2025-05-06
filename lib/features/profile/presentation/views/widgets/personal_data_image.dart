import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/cached_network_model.dart';
import 'package:food_delivery/core/widgets/custom_cached_network_image.dart';

import '../../manager/personal_data/personal_data_bloc.dart';
import 'profile_user_image.dart';

class PersonalDataImage extends StatelessWidget {
  const PersonalDataImage({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final image = context.read<PersonalDataBloc>();
    return ProfileUserImage(
        child: image.image == null
            ? CustomCachedNetworkImage(
                cachedNetworkModel: CachedNetworkModel(imageUrl: imageUrl!))
            : Image.file(image.image!, fit: BoxFit.cover));
  }
}
