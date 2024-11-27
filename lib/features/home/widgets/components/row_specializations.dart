import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/colors.dart';
import 'package:flutter_advanced/core/themes/styles.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RowSpecializations extends StatelessWidget {
  final List<SpecializationsData?>? specializationDataList;
  var selectedSpecializationIndex = 0;
  RowSpecializations({super.key,required this.specializationDataList});
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationDataList?.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: Column(
                children: [
                  index == selectedSpecializationIndex
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorsManager.darkBlue,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: ColorsManager.lightBlue,
                            child: SvgPicture.asset(
                              'assets/images/general_speciality.svg',
                              height: 42.h,
                              width: 42.w,
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 28,
                          backgroundColor: ColorsManager.lightBlue,
                          child: SvgPicture.asset(
                            'assets/images/general_speciality.svg',
                            height: 40.h,
                            width: 40.w,
                          ),
                        ),
                  verticalSpace(8),
                  Text(
                    specializationDataList?[index]?.name ?? 'Specialization',
                    style: index == selectedSpecializationIndex
                        ? TextStyles.font14DarkBlueBold
                        : TextStyles.font12DarkBlueRegular,
                  ),
              
                ],
              ),
            );
        },
      ),
    );
  }
}