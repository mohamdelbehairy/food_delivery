part of 'home_bloc.dart';

sealed class HomeEvent {}

class ChangeBottomNavEvent extends HomeEvent {
  final int index;

  ChangeBottomNavEvent({required this.index});
}

class UserDataUpdatedEvent extends HomeEvent {
  final UserDataModel userDataModel;
  UserDataUpdatedEvent(this.userDataModel);
}
