import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/network/dio/dio_service.dart';
import 'package:flutter_advanced/features/auth/data/api/auth_api_service.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';
import 'package:flutter_advanced/features/home/data/api/home_api_service.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // dio
  Dio dio = DioService().dio;

  // auth cubits
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt.get<AuthApiService>()));

  // home cubits
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt.get<HomeApiService>()));

  
}