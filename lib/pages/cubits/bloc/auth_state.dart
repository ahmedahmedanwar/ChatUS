part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class RegisterSuccess extends AuthState {}
 class RegisterLoading extends AuthState {}
 // ignore: must_be_immutable
 class RegisterFailure extends AuthState {
  String errorMessage;
  RegisterFailure({required this.errorMessage});
 }

//LoginState
 class LoginSuccess extends AuthState {}
 class LoginLoading extends AuthState {}
 // ignore: must_be_immutable
 class LoginFailure extends AuthState {
  String errorMessage;
  LoginFailure({required this.errorMessage});
 }