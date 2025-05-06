import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../manager/profile/profile_cubit.dart';
import 'profile_user_data_image.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Column(
            children: [
              ProfileUserDataImage(userImage: state.userDataModel.userImage),
              const SizedBox(height: 20),
              Text(state.userDataModel.userName, style: Styles.semiBold16),
              const SizedBox(height: 4),
              Text(state.userDataModel.userEmail,
                  style: Styles.reqular14
                      .copyWith(color: const Color(0xff878787))),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
