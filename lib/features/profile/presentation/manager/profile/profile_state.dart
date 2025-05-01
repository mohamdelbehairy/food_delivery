part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetUserDataSuccess extends ProfileState {
  final UserDataModel userDataModel;

  GetUserDataSuccess({required this.userDataModel});
}
