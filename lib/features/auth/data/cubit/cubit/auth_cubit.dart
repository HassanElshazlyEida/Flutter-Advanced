import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/auth_state.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(const AuthState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    emit(const AuthState.loading());
    final response = await _authRepository.login(
       LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse){
      emit(AuthState.success(loginResponse));
    }, error: (error){
      emit(AuthState.error(message: error.message ?? ''));
    });
    
  }
}
