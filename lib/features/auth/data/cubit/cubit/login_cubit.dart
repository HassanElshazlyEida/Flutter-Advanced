import 'package:bloc/bloc.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/login_state.dart';
import 'package:flutter_advanced/features/auth/data/repos/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(const LoginState.initial());

  void emitLogin(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepository.login(loginRequestBody);
    response.when(
      success: (loginResponse){
      emit(LoginState.success(loginResponse));
    }, error: (error){
      emit(LoginState.error(message: error.message ?? ''));
    });
    
  }
}
