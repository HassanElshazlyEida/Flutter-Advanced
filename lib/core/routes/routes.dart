import 'package:flutter_advanced/features/auth/widgets/login_screen.dart';
import 'package:flutter_advanced/features/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';

}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.onboarding,
      page: ()  => const OnboardingScreen(), 
    ),
     GetPage(
      name: Routes.login,
      page: ()  => const LoginScreen(), 
    ),
  ];
}