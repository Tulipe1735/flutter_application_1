import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());

      await Future.delayed(const Duration(seconds: 2)); // 模拟网络请求

      // 简单验证逻辑
      if (event.username.isEmpty ||
          event.password.isEmpty ||
          event.confirmPassword.isEmpty) {
        emit(RegisterFailure("Please fill all fields"));
        return;
      }

      if (event.password != event.confirmPassword) {
        emit(RegisterFailure("Passwords do not match"));
        return;
      }

      if (event.phoneNumber.length != 11 || event.idNumber.length != 18) {
        emit(RegisterFailure("Invalid phone or ID number"));
        return;
      }

      // 模拟注册成功
      emit(RegisterSuccess());
    });
  }
}
