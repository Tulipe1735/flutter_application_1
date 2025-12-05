// login_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(LoginStatus.init)) {
    on<LoginEvent>((event, emit) async {
      emit(LoginState(LoginStatus.loading));
      await Future.delayed(Duration(seconds: 2)); // 模拟网络请求

      // hardcode的默认username和password
      if (event.username == "user123" && event.password == "123456") {
        emit(LoginState(LoginStatus.success));
      } else {
        emit(LoginState(LoginStatus.error));
      }
    });
  }
}
