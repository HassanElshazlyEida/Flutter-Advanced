import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routes/routes.dart';
import 'package:flutter_advanced/core/themes/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
          title: 'Doc Doc',
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: Colors.white
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onboarding,
          getPages: AppPages.pages,
        )
    );
  }
} 