part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//////////////SignIn State////////////
class SignInLoadingState extends AuthState {}

class SignInFailedState extends AuthState {
  final String msg;

  SignInFailedState({required this.msg});
}

class SignInSuccessState extends AuthState {}

//////////////Register State////////////
class RegisterLoadingState extends AuthState {}

class RegisterFailedState extends AuthState {
  final String msg;

  RegisterFailedState({required this.msg});
}

class RegisterSuccessState extends AuthState {}

//////////////ForgetPass State////////////
class ForgetPassLoadingState extends AuthState {}

class ForgetPassFailedState extends AuthState {
  final String msg;

  ForgetPassFailedState({required this.msg});
}

class ForgetPassSuccessState extends AuthState {}

//////////////// New Password State////////////////
class NewPassLoadingState extends AuthState {}

class NewPassFailedState extends AuthState {
  final String msg;

  NewPassFailedState({required this.msg});
}

class NewPassSuccessState extends AuthState {}

//////////////// OTP  State////////////////
class OtpLoadingState extends AuthState {}

class OtpFailedState extends AuthState {
  final String msg;

  OtpFailedState({required this.msg});
}

class OtpSuccessState extends AuthState {}
