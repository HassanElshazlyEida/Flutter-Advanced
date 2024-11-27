import 'package:bloc/bloc.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {

  final HomeRepository _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationsSuccess(specializationsResponseModel));
      },
      error: (error) {
        emit(HomeState.specializationsError(message: error.message ?? 'An error occurred'));
      },
    );
  }
}
