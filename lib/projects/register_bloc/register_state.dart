part of 'register_bloc.dart';

enum RegisterStatus { init, success, error, loading }

class RegisterState {
  const RegisterState(this.status);
  final RegisterStatus status;
}
