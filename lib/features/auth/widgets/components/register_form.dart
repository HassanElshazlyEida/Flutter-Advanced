import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/core/helpers/regex_validation.dart';
import 'package:flutter_advanced/core/widgets/regular_text_form_field.dart';
import 'package:flutter_advanced/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:flutter_advanced/features/auth/widgets/components/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<AuthCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = RegexValidation.hasLowerCase(passwordController.text);
        hasUppercase = RegexValidation.hasUpperCase(passwordController.text);
        hasSpecialCharacters = RegexValidation.hasSpecialCharacter(passwordController.text);
        hasNumber = RegexValidation.hasNumber(passwordController.text);
        hasMinLength = RegexValidation.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().formKey,
      child: Column(
        children: [
          RegularTextFormField(
            hintText: 'Name',
            controller: context.read<AuthCubit>().nameController,
          ),
          verticalSpace(18),
          RegularTextFormField(
            hintText: 'Phone number',
             validator: (value) {
              if (value!.isNullOrEmpty() || !RegexValidation.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<AuthCubit>().phoneController,
          ),
          verticalSpace(18),
          RegularTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value!.isNullOrEmpty() ||
                  !RegexValidation.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<AuthCubit>().emailController,
          ),
          verticalSpace(18),
          RegularTextFormField(
            controller: context.read<AuthCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(18),
          RegularTextFormField(
            controller:
                context.read<AuthCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialChar: hasSpecialCharacters,
            hasDigit: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}