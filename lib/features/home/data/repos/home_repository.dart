import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/api/handling/api_error_model.dart';
import 'package:flutter_advanced/core/network/api/handling/api_return.dart';
import 'package:flutter_advanced/features/home/data/api/home_api_service.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';

class HomeRepository {
  final HomeApiService _homeApiService;

  HomeRepository(this._homeApiService);

  Future<ApiReturn<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await _homeApiService.getSpecializations();
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
}