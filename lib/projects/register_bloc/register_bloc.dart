import 'package:flutter_application_1/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository repo;

  RegisterBloc(this.repo) : super(RegisterState(RegisterStatus.init)) {
    on<RegisterEvent>((event, emit) async {
      emit(RegisterState(RegisterStatus.loading));

      try {
        final res = await repo.register(event.username, event.password);

        if (res.code == 1) {
          emit(RegisterState(RegisterStatus.success));
        } else {
          emit(RegisterState(RegisterStatus.error));
        }
      } catch (e) {
        emit(RegisterState(RegisterStatus.error));
      }
    });
  }
}
