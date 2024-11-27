import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/api/api_constants.dart';
import 'package:flutter_advanced/features/auth/data/models/auth_response.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio,{String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<AuthResponse> login(
    @Body() LoginRequestBody loginRequestBody
  );

  @POST(ApiConstants.register)
  Future<AuthResponse> register(
    @Body() RegisterRequestBody registerRequestBody
  );
} 