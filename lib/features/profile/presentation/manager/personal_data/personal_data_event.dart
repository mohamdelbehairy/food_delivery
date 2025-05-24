part of 'personal_data_bloc.dart';

sealed class PersonalDataEvent {}

class PickImageEvent extends PersonalDataEvent {}

class UpdatePersonalDataEvent extends PersonalDataEvent {}

class CancleChangesEvent extends PersonalDataEvent {}
