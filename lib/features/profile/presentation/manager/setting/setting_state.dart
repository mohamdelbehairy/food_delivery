part of 'setting_bloc.dart';

sealed class SettingState {}

final class SettingInitial extends SettingState {}

final class ChangeSwitchState extends SettingState {}
