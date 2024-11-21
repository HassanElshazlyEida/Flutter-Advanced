import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/login_state.dart';
import 'package:flutter_advanced/features/auth/data/repos/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    emit(const LoginState.loading());
    final response = await _loginRepository.login(
       LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse){
      emit(LoginState.success(loginResponse));
    }, error: (error){
      emit(LoginState.error(message: error.message ?? ''));
    });
    
  }
}
