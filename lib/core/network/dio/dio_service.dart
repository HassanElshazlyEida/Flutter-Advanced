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
    dio.interceptors.addAll([
      _authInterceptor(),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ]);
  }

  _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: _handleRequest,
      onResponse: _handleResponse,
      onError: _handleError,
    );
  }

  _handleRequest(options, handler) {
    options.headers['Accept'] = 'application/json';
    final token = CacheHelper.getCache('token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  _handleResponse(response, handler) {
    if (response.statusCode == 401) {
      _handleUnauthorized();
    }
    return handler.next(response);
  }

  _handleError(e, handler) {
    if (e.response?.statusCode == 401) {
      _handleUnauthorized();
    }
    return handler.next(e);
  }

  _handleUnauthorized() {
    CacheHelper.removeCache('token');
    Get.toNamed(Routes.login);
  }

}