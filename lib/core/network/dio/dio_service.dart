import 'package:dio/dio.dart';
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
        // TODO 
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode == 401) {
          // TODO 
        }
        
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
         // TODO 
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