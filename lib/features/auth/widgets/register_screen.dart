import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_advanced/core/widgets/regular_button.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_cubit.dart';
import 'package:flutter_advanced/features/auth/widgets/components/already_have_account_text.dart';
import 'package:flutter_advanced/features/auth/widgets/components/register_bloc_listener.dart';
import 'package:flutter_advanced/features/auth/widgets/components/register_form.dart';
import 'package:flutter_advanced/features/auth/widgets/components/terms_and_conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14greyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const RegisterForm(),
                    verticalSpace(40),
                    RegularButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenRegister(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const RegisterBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenRegister(BuildContext context) {
    if (context.read<AuthCubit>().formKey.currentState!.validate()) {
      context.read<AuthCubit>().register();
    }
  }
}