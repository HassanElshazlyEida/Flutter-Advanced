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
        options.headers['Authorization'] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzMyNjM1NTkxLCJleHAiOjE3MzI3MjE5OTEsIm5iZiI6MTczMjYzNTU5MSwianRpIjoia2FHTmQ2bXNTZVY0QUZBVSIsInN1YiI6IjI3NzIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.UAVLjeJbbRQ3rGDtDDGzrBYmMeljj0OwPoJix2H6Fzk';
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