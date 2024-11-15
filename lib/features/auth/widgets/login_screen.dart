import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_advanced/core/widgets/regular_button.dart';
import 'package:flutter_advanced/core/widgets/regular_text_form_field.dart';
import 'package:flutter_advanced/features/auth/widgets/components/dont_have_account_text.dart';
import 'package:flutter_advanced/features/auth/widgets/components/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
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
                Form(
                  key: formKey,
                  child:   Column(
                    children: [
                      const RegularTextFormField(hintText: 'Email'),
                      verticalSpace(18),
                       RegularTextFormField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(isObscureText? Icons.visibility_off : Icons.visibility)
                        ),
                      ),
                      verticalSpace(10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password?',style: TextStyles.font13BlueRegular,)
                      ),
                      verticalSpace(40),
                      const RegularButton(buttonText: 'Login',),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText(),
                    ]
                  )
                )
              ],
            ),
          )
        )
      )
    );
  }
}