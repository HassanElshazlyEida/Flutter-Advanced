import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/regex_validation.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/auth/widgets/components/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced/core/widgets/regular_text_form_field.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialChar = false;
  bool hasDigit = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          RegularTextFormField(hintText: 'Email', controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if(!RegexValidation.isEmailValid(value ?? '')){
                return 'Invalid Email';
              }
              return null;
              
            },
          ), 
          verticalSpace(18),
          RegularTextFormField(controller: context.read<LoginCubit>().passwordController,  hintText: 'Password',
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
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialChar: hasSpecialChar,
            hasDigit: hasDigit,
            hasMinLength: hasMinLength,
          )
          ],
      )
    );
  }
  
  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase =  RegexValidation.hasLowerCase(passwordController.text);
        hasUpperCase =  RegexValidation.hasUpperCase(passwordController.text);
        hasSpecialChar =  RegexValidation.hasSpecialCharacter(passwordController.text);
        hasDigit =  RegexValidation.hasNumber(passwordController.text);
        hasMinLength =  RegexValidation.hasMinLength(passwordController.text);
      });
    });
  }
}