import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/api/api_constants.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio,{String baseUrl}) = _HomeApiService;


  @GET(ApiConstants.specializations)
  Future<SpecializationsResponseModel> getSpecializations();
} 