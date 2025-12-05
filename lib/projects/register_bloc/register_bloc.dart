import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState(RegisterStatus.init)) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterState(RegisterStatus.loading));

      await Future.delayed(const Duration(seconds: 2)); // 模拟网络请求

      // 简单验证逻辑
      if (event.username.isEmpty ||
          event.password.isEmpty ||
          event.confirmPassword.isEmpty) {
        emit(RegisterState(RegisterStatus.error));
        return;
      }

      if (event.password != event.confirmPassword) {
        emit(RegisterState(RegisterStatus.error));
        return;
      }

      if (event.phoneNumber.length != 11 || event.idNumber.length != 18) {
        emit(RegisterState(RegisterStatus.error));
        return;
      }

      // 模拟注册成功
      emit(RegisterState(RegisterStatus.success));
    });
  }
}
