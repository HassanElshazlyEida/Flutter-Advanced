import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/middleware/auth_middleware.dart';
import 'package:flutter_advanced/core/middleware/guest_middleware.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_cubit.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';
import 'package:flutter_advanced/features/auth/widgets/login_screen.dart';
import 'package:flutter_advanced/features/auth/widgets/register_screen.dart';
import 'package:flutter_advanced/features/home/data/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repository.dart';
import 'package:flutter_advanced/features/home/widgets/home_screen.dart';
import 'package:flutter_advanced/features/onboarding/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Routes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.onboarding,
      page: ()  => const OnboardingScreen(), 
      middlewares: [
        GuestMiddleware()
      ],
    ),
    GetPage(
      name: Routes.login,
      page: ()  => BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepository>()),
        child: const LoginScreen(),
      ),
      middlewares: [
        GuestMiddleware()
      ],
    ),
    GetPage(
      name: Routes.register,
      page: ()  => BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepository>()),
        child: const RegisterScreen(),
      ),
      middlewares: [
        GuestMiddleware()
      ],
    ),
    GetPage(
      name: Routes.home,
      page: ()  => BlocProvider(
        create: (context) => HomeCubit(getIt.get<HomeRepository>())..getSpecializations(),
        child: const HomeScreen(),
      ),
      middlewares: [
        AuthMiddleware()
      ]
    ),
  ];
}