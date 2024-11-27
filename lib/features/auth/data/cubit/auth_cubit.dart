import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/network/api/handling/api_return.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_state.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(const AuthState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

 

  Future<void> _handleAuthOperation<T>({
    required Future<ApiReturn<T>> Function() authAction,
  }) async {
    emit(const AuthState.loading());
    final response = await authAction();
    response.when(
      success: (authResponse) {
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
}
