
import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routes/routes.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';
import 'package:get/get.dart';

class GuestMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print("redirect -----------");
    if (AuthRepository.isAuthenticated()) {
      return const RouteSettings(name: Routes.home);
    }
    return null;
  }
}