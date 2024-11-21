import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_advanced/core/widgets/regular_button.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:flutter_advanced/features/auth/data/repos/auth_repository.dart';
import 'package:flutter_advanced/features/auth/widgets/components/dont_have_account_text.dart';
import 'package:flutter_advanced/features/auth/widgets/components/email_and_password.dart';
import 'package:flutter_advanced/features/auth/widgets/components/login_bloc_listener.dart';
import 'package:flutter_advanced/features/auth/widgets/components/terms_and_conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back',style: TextStyles.font24BlueBold,),
                verticalSpace(8),
                Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14greyRegular,),
                verticalSpace(36),
                  Column(
                    children: [
                      const EmailAndPassword(),
                      verticalSpace(24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password?',style: TextStyles.font13BlueRegular,)
                      ),
                      verticalSpace(40),
                      RegularButton(buttonText: 'Login',onPressed: () {
                        validateThenLogin(context);
                      },),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText(),
                      const LoginBlocListener()
                    ]
                  )
              ],
            ),
          )
        )
      )
    );
  }

  void validateThenLogin(BuildContext context) {
    if(context.read<AuthCubit>().formKey.currentState!.validate()){
      context.read<AuthCubit>().login();
    }
  }
}