import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogo extends StatelessWidget {
  const DocLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/logo.svg'),
        SizedBox(width: 10.w),
        Text(
          'DocDoc',
          style: TextStyles.font24Black700Weight
        )
      ],
    );
  }
}