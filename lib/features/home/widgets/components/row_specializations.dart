import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/colors.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RowSpecializations extends StatelessWidget {
  const RowSpecializations({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset('assets/images/general_speciality.svg',height: 40.h, width: 20.w,),
                ),
                SizedBox(height: 8.h,),
                Text('Radiology',style: TextStyles.font12greyMedium,)
              ],
            )
          );
        },
      ),
    );
  }
}