part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent{
  final String email;
  final String password;

  LoginEvent({required this.email,required this.password});
}

//We will use Auth Cubit in this RegisterClass
class RegisterEvent extends AuthEvent{}
