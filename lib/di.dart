import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import './data/api/api_service.dart';
import './data/repositories/auth_repository.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(sl<ApiService>()),
  );
}
