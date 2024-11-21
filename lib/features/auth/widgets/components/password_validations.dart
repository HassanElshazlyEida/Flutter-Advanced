import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/colors.dart';
import 'package:flutter_advanced/core/themes/styles.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialChar,
    required this.hasDigit,
    required this.hasMinLength,
  });

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialChar;
  final bool hasDigit;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter',hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter',hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At least 1 special character',hasSpecialChar),
        verticalSpace(2),
        buildValidationRow('At least 1 number ',hasDigit),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long',hasMinLength),
        verticalSpace(2),
      ]
    );
  }
  Widget buildValidationRow(String text, bool isValidated){
    return Row( 
      children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: ColorsManager.grey,
      ),
      horizontalSpace(6),
      Text(text,style: TextStyles.font13DarkBlueRegular.copyWith(
        decoration: isValidated ?   TextDecoration.lineThrough : TextDecoration.none,
        decorationColor: Colors.green,
        decorationThickness: 2,
        color: isValidated ? ColorsManager.grey : ColorsManager.darkBlue
      ))

      ],
    );
  }
}