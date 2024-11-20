import 'package:dio/dio.dart';

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
  }
}