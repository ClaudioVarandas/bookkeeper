import 'package:dio/dio.dart';
import 'package:bookkeeper/constants.dart';

class AuthEndpoints {
  Dio _dio;

  AuthEndpoints(this._dio);

  Future<Response> postLogin(String username, String password) {
    return _dio.post(pathAuthLogin, data: {"username": username, "password": password});
  }
}
