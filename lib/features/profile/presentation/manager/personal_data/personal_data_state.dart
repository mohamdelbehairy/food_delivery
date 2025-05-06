part of 'personal_data_bloc.dart';

sealed class PersonalDataState {}

final class PersonalDataInitial extends PersonalDataState {}

final class PickImageSuccess extends PersonalDataState {}

final class PersonalDataLoading extends PersonalDataState {}

final class UpdateUserData extends PersonalDataState {}
