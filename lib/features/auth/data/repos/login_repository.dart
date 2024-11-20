import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/api/api_service.dart';
import 'package:flutter_advanced/core/network/api/handling/api_error_model.dart';
import 'package:flutter_advanced/core/network/api/handling/api_return.dart';
import 'package:flutter_advanced/features/auth/data/models/login_response.dart';

class LoginRequestBody{
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});
}
class LoginRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<ApiReturn<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await   _apiService.login(loginRequestBody);
      return ApiReturn.success(response);
    }on DioException catch (e) {
      return ApiReturn.error(ApiErrorModel(
        code: e.response?.statusCode,
        message: e.message,
      ));
    }
   
  }
}