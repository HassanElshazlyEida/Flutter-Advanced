import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/home/data/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/widgets/components/doctors/doctor_bloc_builder.dart';
import 'package:flutter_advanced/features/home/widgets/components/shimmer/doctors_shimmer_loading.dart';
import 'package:flutter_advanced/features/home/widgets/components/shimmer/specializations_shimmer_loading.dart';
import 'package:flutter_advanced/features/home/widgets/components/specializations/row_specializations.dart';
import 'package:flutter_advanced/features/home/widgets/components/specializations/row_specializations_see_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => 
      current is SpecializationsLoading ||
      current is SpecializationsSuccess ||
      current is SpecializationsError ,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsSuccess: (List<SpecializationsData?>?  specializationsData) {
            return setupSuccess(specializationsData);
          },
          specializationsLoading: (){
            return setUpLoading();
          },
          specializationsError: (message) {
            return setupError();
          },
          orElse: () {
            return setupError();
          },

        );
      },
    );
  }
  Widget setUpLoading(){
    return  Expanded(
      child: Column(
        children: [
          const SpecializationsShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
       )
    );
  }
  Widget setupError() {
    return const SizedBox.shrink();
  }
  Widget setupSuccess(List<SpecializationsData?>?   specializationsData) {
    return   Expanded(
      child: Column(
        children: [
          const RowSpecializationsSeeAll(),
          verticalSpace(16),
          RowSpecializations(
            specializationDataList: specializationsData,
          ),
    
          verticalSpace(8),
          const DoctorsBlocBuilder()
        ],
      ),
    );
  }
}