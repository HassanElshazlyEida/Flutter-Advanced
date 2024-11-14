import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/colors.dart';
import 'package:flutter_advanced/core/themes/styles.dart';

class RegularButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const RegularButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.primary),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 52)
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        )
      ),
      
      child: Text(
        text,
        style: TextStyles.font16WhiteSemiBold
      )
    );
  }
}