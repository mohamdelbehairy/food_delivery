part of 'personal_data_bloc.dart';

sealed class PersonalDataEvent {}

class PickImageEvent extends PersonalDataEvent {}

class SavePersonalDataEvent extends PersonalDataEvent {}
