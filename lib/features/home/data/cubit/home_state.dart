part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(List<SpecializationsData?>? specializationList) = SpecializationsSuccess;
  const factory HomeState.specializationsError({required String message}) = SpecializationsError;
  const factory HomeState.doctorsSuccess(List<Doctors?> doctorsList) = DoctorsSuccess;
  const factory HomeState.doctorsError({required String message}) = DoctorsError;

}
