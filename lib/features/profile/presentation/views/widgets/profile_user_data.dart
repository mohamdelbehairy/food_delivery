import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../../home/presentation/manager/home/home_bloc.dart';
import 'profile_user_data_image.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            ProfileUserDataImage(userImage: userData.userDataModel?.userImage),
            const SizedBox(height: 20),
            Text(userData.userDataModel!.userName, style: Styles.semiBold16),
            const SizedBox(height: 4),
            Text(userData.userDataModel!.userEmail,
                style:
                    Styles.regular14.copyWith(color: const Color(0xff878787))),
          ],
        );
      },
    );
  }
}
