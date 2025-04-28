abstract class AuthEvent {}

class LoginVisbleEvent extends AuthEvent {}

class RegisterVisbleEvent extends AuthEvent {}

class LoginButtonEvent extends AuthEvent {}

class RegisterButtonEvent extends AuthEvent {}

class PrivacyPolicyEvent extends AuthEvent {}

class LoginGoogleEvent extends AuthEvent {}

class LoginFacebookEvent extends AuthEvent {}

class LoginTwitterEvent extends AuthEvent {}

class ForgotPasswordEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
