part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeBottomNavState extends HomeState {}

final class ChangeCategory extends HomeState {}

final class GetProductDataSuccess extends HomeState {}

final class GetUserDataSuccess extends HomeState {}

final class ChangeGenderIndex extends HomeState {}
