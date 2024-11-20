import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/api/api_service.dart';
import 'package:flutter_advanced/core/network/dio/dio_service.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/auth/data/repos/login_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void  setupGetIt()   {
  // dio
  Dio dio = DioService().dio;
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // cubits
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt.get<ApiService>()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt.get<LoginRepository>()));

}