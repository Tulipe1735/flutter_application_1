part of 'register_bloc.dart';

abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String password;
  final String confirmPassword;
  final String idNumber;
  final String phoneNumber;

  RegisterButtonPressed({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.idNumber,
    required this.phoneNumber,
  });
}
