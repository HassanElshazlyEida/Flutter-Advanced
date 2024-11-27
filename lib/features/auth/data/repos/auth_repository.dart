import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/api/handling/api_error_model.dart';
import 'package:flutter_advanced/core/network/api/handling/api_return.dart';
import 'package:flutter_advanced/features/auth/data/api/auth_api_service.dart';
import 'package:flutter_advanced/features/auth/data/models/auth_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_repository.g.dart';


class AuthRepository {
  final AuthApiService _apiService;

  AuthRepository(this._apiService);


  Future<ApiReturn<T>> _handleApiRequest<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return ApiReturn.success(response);
    } on DioException catch (e) {
      return ApiReturn.error(
        ApiErrorModel(
          code: e.response?.statusCode,
          message: e.response?.data['message'],
        ),
      );
    }
  }

  Future<ApiReturn<AuthResponse>> login(LoginRequestBody loginRequestBody) {
    return _handleApiRequest(() => _apiService.login(loginRequestBody));
  }

  Future<ApiReturn<AuthResponse>> register(RegisterRequestBody registerRequestBody) {
    return _handleApiRequest(() => _apiService.register(registerRequestBody));
  }
  
}
@JsonSerializable()
class LoginRequestBody{
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);

}
@JsonSerializable()
class RegisterRequestBody {
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final int gender;

  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}