import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/regex_validation.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/auth/data/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced/core/widgets/regular_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController passwordController;


  @override
  void initState() {
    super.initState();
    passwordController = context.read<AuthCubit>().passwordController;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().formKey,
      child: Column(
        children: [
          RegularTextFormField(hintText: 'Email', controller: context.read<AuthCubit>().emailController,
            validator: (value) {
              if(!RegexValidation.isEmailValid(value ?? '')){
                return 'Invalid Email';
              }
              return null;
              
            },
          ), 
          verticalSpace(18),
          RegularTextFormField(controller: context.read<AuthCubit>().passwordController,  hintText: 'Password',
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
          ],
      )
    );
  }
  
}