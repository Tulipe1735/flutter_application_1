import '../api/api_service.dart';
import '../models/user_model.dart';
import '../models/login_response.dart';

class AuthRepository {
  final ApiService api;

  AuthRepository(this.api);

  Future<LoginResponse> login(String username, String password) {
    return api.login(UserModel(username: username, password: password));
  }

  Future<LoginResponse> register(String username, String password) {
    return api.register(UserModel(username: username, password: password));
  }
}
