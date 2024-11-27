import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/helpers/cache_helper.dart';
import 'package:flutter_advanced/core/routes/routes.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class DioService {
  final Dio dio = Dio(BaseOptions(
   
  ));


  DioService() {
    _initializeInterceptors();
  }

  void _initializeInterceptors() {
     dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler)  {
        options.headers['Accept'] = 'application/json';
        String? token =  CacheHelper.getCache('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode == 401) {
          CacheHelper.removeCache('token');
          Get.toNamed(Routes.login);
        }
        
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          CacheHelper.removeCache('token');
          Get.toNamed(Routes.login);
        }
        return handler.next(e);
      },
    ));
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }
}