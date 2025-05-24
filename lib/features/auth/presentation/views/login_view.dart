import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../../core/utils/services/firebase_auth_service.dart';
import '../../../../core/utils/services/firebase_firestore_service.dart';
import '../../../../core/utils/services/shared_pref_service.dart';
import '../../../../core/utils/services/url_launcher_service.dart';
import '../manager/auth/auth_bloc.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          Helper.getIt.get<FirebaseAuthService>(),
          Helper.getIt.get<FirebaseFirestoreService>(),
          Helper.getIt.get<SharedPrefService>(),
          Helper.getIt.get<UrlLauncherService>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
