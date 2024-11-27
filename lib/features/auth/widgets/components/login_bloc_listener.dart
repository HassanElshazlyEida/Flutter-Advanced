import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/core/helpers/helpers.dart';
import 'package:flutter_advanced/core/routes/routes.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_cubit.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => current is Loading || current is Error || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => Helpers.showDefaultDialog(context),
          error: (message)  { context.pop();  Get.snackbar('Failed', message); },
          success: (loginResponse)  { context.pop(); Get.toNamed(Routes.home); },
        );
      },
      child: const  SizedBox.shrink(),
    );
  }
}