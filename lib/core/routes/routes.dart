import 'package:flutter_advanced/features/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String onboarding = '/onboarding';
  
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.onboarding,
      page: ()  => const OnboardingScreen(), 
    ),
  ];
}