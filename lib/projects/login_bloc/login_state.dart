part of 'login_bloc.dart';

enum LoginStatus { init, success, error, loading }

class LoginState {
  const LoginState(this.status);
  final LoginStatus status;
}
