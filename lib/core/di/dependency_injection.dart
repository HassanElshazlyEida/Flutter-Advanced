import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/api/api_service.dart';
import 'package:flutter_advanced/core/network/dio/dio_service.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // dio
  Dio dio = DioService().dio;
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // cubits
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt.get<ApiService>()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt.get<AuthRepository>()));

}