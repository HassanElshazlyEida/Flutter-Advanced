import 'package:dio/dio.dart';
import 'package:flutter_advanced/features/auth/data/login_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_advanced/core/network/api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio,{String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login({
    required String email,
    required String password,
  });
} 