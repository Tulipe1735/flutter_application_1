import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/user_model.dart';
import '../models/login_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: " http://121.36.32.43:8081/swagger-ui/index.html")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/student/login")
  Future<LoginResponse> login(@Body() UserModel user);

  @POST("/student/register")
  Future<LoginResponse> register(@Body() UserModel user);
}
