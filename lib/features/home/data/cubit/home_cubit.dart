import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {

  final HomeRepository _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  
  List<SpecializationsData?>? specializationList = [];

  

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (SpecializationsResponseModel specializationsResponseModel) {
        specializationList = specializationsResponseModel.specializationDataList ?? [];
        emit(HomeState.specializationsSuccess(specializationList));
        getDoctorsList(specializationId: specializationList?.first?.id ?? 0);
       
      },
      error: (error) {
        emit(HomeState.specializationsError(message: error.message ?? 'An error occurred'));
      },
    );
  }
  List<Doctors?>? doctorsList = [];
  void getDoctorsList({required int specializationId}){
    doctorsList = specializationList?.firstWhere((element) => element?.id == specializationId)?.doctorsList;
    if(doctorsList.isNullOrEmpty()){
      emit(const HomeState.doctorsError(message: 'No doctors found'));
    }else {
      emit(HomeState.doctorsSuccess(doctorsList!));
    }
  }
}
