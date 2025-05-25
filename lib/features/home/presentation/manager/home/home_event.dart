part of 'home_bloc.dart';

sealed class HomeEvent {}

class ChangeBottomNavEvent extends HomeEvent {
  final int index;

  ChangeBottomNavEvent({required this.index});
}

final class ChangeCategoryEvent extends HomeEvent {
  final int index;
  ChangeCategoryEvent(this.index);
}

final class GetProductDateEvent extends HomeEvent {
  final List<ProductDataModel> productsList;

  GetProductDateEvent(this.productsList);
}

class UserDataUpdatedEvent extends HomeEvent {
  final UserDataModel userDataModel;
  UserDataUpdatedEvent(this.userDataModel);
}

class GenderEvent extends HomeEvent {
  final int index;

  GenderEvent({required this.index});
}
