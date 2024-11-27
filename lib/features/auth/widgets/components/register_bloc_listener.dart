import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/core/helpers/helpers.dart';
import 'package:flutter_advanced/core/routes/routes.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_cubit.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => current is Loading || current is Error || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => Helpers.showDefaultDialog(context),
          error: (message)  { context.pop();  Get.snackbar('Failed', message); },
          success: (loginResponse)  { context.pop();   showSuccessDialog(context);},
        );
      },
      child: const  SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Register Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                Get.toNamed(Routes.login);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

}