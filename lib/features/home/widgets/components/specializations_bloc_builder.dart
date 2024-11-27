import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/home/data/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/widgets/components/doctors_list_view.dart';
import 'package:flutter_advanced/features/home/widgets/components/row_specializations.dart';
import 'package:flutter_advanced/features/home/widgets/components/row_specializations_see_all.dart';
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
          specializationsSuccess: (SpecializationsResponseModel specializationsResponseModel){
            return setupSuccess(specializationsResponseModel);
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
    return   SizedBox(
      height: 100.h,
      child: const Center(child : CircularProgressIndicator()),
    );
  }
  Widget setupError() {
    return const SizedBox.shrink();
  }
  Widget setupSuccess(SpecializationsResponseModel specializations) {
   var specializationDataList = specializations.specializationDataList;
    return   Expanded(
      child: Column(
        children: [
          const RowSpecializationsSeeAll(),
          verticalSpace(16),
          RowSpecializations(
            specializationDataList: specializationDataList,
          ),
          verticalSpace(8),
            DoctorsListView(
            doctorsList: specializationDataList?[0]?.doctorsList,
          )
        ],
      ),
    );
  }
}