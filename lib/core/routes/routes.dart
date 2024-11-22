import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:flutter_advanced/features/auth/widgets/login_screen.dart';
import 'package:flutter_advanced/features/auth/widgets/register_screen.dart';
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
    ),
    GetPage(
      name: Routes.login,
      page: ()  => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const LoginScreen(),
      ),
    ),
    GetPage(
      name: Routes.register,
      page: ()  => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const RegisterScreen(),
      ),
    ),
    GetPage(
      name: Routes.home,
      page: ()  => const HomeScreen(), 
    ),
  ];
}