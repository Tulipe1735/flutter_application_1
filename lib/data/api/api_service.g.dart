// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://121.36.32.43:8081/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponse> login(UserModel user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/student/login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
    );
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponse> register(UserModel user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/student/register',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
    );
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }
}
