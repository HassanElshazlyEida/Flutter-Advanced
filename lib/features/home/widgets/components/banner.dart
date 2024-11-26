import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              image: const DecorationImage(image: AssetImage('assets/images/banner_bg.png'), fit: BoxFit.cover),
            ),
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 150.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Book and schedule with nearest doctor', style: TextStyles.font18WhiteMedium,textAlign: TextAlign.start,),
                    verticalSpace(8),
                    ElevatedButton(onPressed: (){}, child:  Text('Find Nearby',style: TextStyles.font13DarkBlueRegular,))
                  ]),
                ),
            
              ],
            ),
          ),
          Positioned(
              right: 8.w, 
              top: 0,
              child: Image.asset('assets/images/banner_image.png', height: 200.h,)
            )

        ],
      ),
    );
  }
}