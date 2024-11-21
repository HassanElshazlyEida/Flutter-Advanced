

import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/colors.dart';

class Helpers {
  static void  showDefaultDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: ColorsManager.mainBlue,
        ),
      ),
    );
  }
}