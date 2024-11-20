
import 'package:flutter_advanced/core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_return.freezed.dart';

@Freezed()
class ApiReturn<T> with _$ApiReturn<T> {
  const factory ApiReturn.success(T data) = Success<T>;
  const factory ApiReturn.error(ApiErrorModel error) = Failure<T>;
}