import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/api/api_service.dart';
import 'package:flutter_advanced/core/network/api/handling/api_error_model.dart';
import 'package:flutter_advanced/core/network/api/handling/api_return.dart';
import 'package:flutter_advanced/features/auth/data/models/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_repository.g.dart';

@JsonSerializable()
class LoginRequestBody{
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);

}
class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<ApiReturn<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await   _apiService.login(loginRequestBody);
      return ApiReturn.success(response);
    }on DioException catch (e) {
      return ApiReturn.error(ApiErrorModel(
        code: e.response?.statusCode,
        message: e.response?.data['message'],
      ));
    }
   
  }
}