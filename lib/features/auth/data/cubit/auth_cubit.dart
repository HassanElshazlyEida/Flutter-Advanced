import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/cache_helper.dart';
import 'package:flutter_advanced/core/network/api/handling/api_return.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_state.dart';
import 'package:flutter_advanced/features/auth/data/models/auth_response.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';
import 'package:flutter/foundation.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(const AuthState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

 

  Future<void> _handleAuthOperation({
    required Future<ApiReturn<AuthResponse>> Function() authAction,
  }) async {
    emit(const AuthState.loading());
    final response = await authAction();
    response.when(
      success: (AuthResponse authResponse) async {
        await saveUserToken(authResponse.userData?.token ?? '');
        emit(AuthState.success(authResponse));
      },
      error: (error) {
        emit(AuthState.error(message: error.message ?? 'An error occurred'));
      },
    );
  }

  void login() {
    _handleAuthOperation(
      authAction: () => _authRepository.login(
        LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
      ),
    );
  }

  void register() {
    _handleAuthOperation(
      authAction: () => _authRepository.register(
        RegisterRequestBody(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmationController.text,
          gender: 0,
        ),
      ),
    );
  }
  Future<void> saveUserToken(String token) async {
    print('user token $token');
    await CacheHelper.setCache('token',token);
  }
}
