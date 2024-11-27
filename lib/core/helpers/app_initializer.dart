
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/helpers/cache_helper.dart';
import 'package:flutter_advanced/core/observer/global_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadEnv();
    await _initCache();
    await setupDependencyInjection();
    await _ensureScreenSize();
    _initBlocObserver();
  }

  static Future<void> _loadEnv() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> _initCache() async {
    await CacheHelper.init();
  }

  static void _initBlocObserver() {
    Bloc.observer = GlobalBlocObserver();
  }

  static Future<void> _ensureScreenSize() async {
    await ScreenUtil.ensureScreenSize();
  }


}