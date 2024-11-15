import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/routes/routes.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_advanced/core/widgets/regular_button.dart';
import 'package:flutter_advanced/features/onboarding/widgets/doc_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 30.w ,bottom: 30.h),
              child:  Column(
                children: [
                    const DocLogo(),
                    verticalSpace(30),
                    Stack(
                      children: [
                        SvgPicture.asset('assets/images/bg_logo.svg'),
                        Container(
                          foregroundDecoration:  BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.white.withOpacity(0.0)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: const [0.14, 0.4],
                            )
                          ),
                          child:  Image.asset('assets/images/onboarding_doctor.png'),  
                        ),
                        Positioned(
                          bottom: 15.h,
                          left: 0,
                          right: 0,
                          child:  Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                            child: Text(
                            'Best Doctor Appointment App',
                            textAlign: TextAlign.center,
                            style: TextStyles.font32BlueBold.copyWith(
                              height: 1.4,
                              
                            )
                            ),
                          ))
                      
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        children: [
                          Text(
                            'tttManage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyles.font13greyRegular,
                          ),
                          verticalSpace(25),
                          RegularButton(buttonText: 'Get Started',onPressed: (){
                            Get.toNamed(Routes.login);
                          },)
                        ],
                      ),
                    ),
               
                ],
              ),
            ),
        ),
      ),
    );
  }
}