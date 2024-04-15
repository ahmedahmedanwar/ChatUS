part of 'auth_cubit.dart';

@immutable

abstract class AuthState {}

 class AuthInitial extends AuthState{}

//RegisterState
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