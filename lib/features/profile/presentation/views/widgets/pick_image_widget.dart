import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/colors.dart';

import '../../manager/personal_data/personal_data_bloc.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final personalData = context.read<PersonalDataBloc>();
    return GestureDetector(
      onTap: () => personalData.add(PickImageEvent()),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 14,
          backgroundColor: Color(0xffF5F5FF),
          child:
              Icon(Icons.camera_alt, size: 18, color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
