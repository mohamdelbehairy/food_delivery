abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class ChangeVisble extends AuthState {}

final class ChangePrivacyPolicy extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class LoginSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}
