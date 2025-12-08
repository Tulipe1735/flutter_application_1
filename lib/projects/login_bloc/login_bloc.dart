// login_bloc.dart

import 'package:flutter_application_1/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repo;
  LoginBloc(this.repo) : super(LoginState(LoginStatus.init)) {
    on<LoginEvent>((event, emit) async {
      emit(LoginState(LoginStatus.loading));

      try {
        final res = await repo.login(event.username, event.password);

        if (res.code == 1) {
          // 登录成功
          emit(LoginState(LoginStatus.success));
        } else {
          // 登录失败
          emit(LoginState(LoginStatus.error));
        }
      } catch (e) {
        emit(LoginState(LoginStatus.error));
      }
    });
  }
}
