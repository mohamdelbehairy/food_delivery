part of 'setting_bloc.dart';

sealed class SettingEvent {}

class PushNotificationEvent extends SettingEvent {
  final bool value;
  PushNotificationEvent(this.value);
}

class LocationEvent extends SettingEvent {
  final bool value;
  LocationEvent(this.value);
}
