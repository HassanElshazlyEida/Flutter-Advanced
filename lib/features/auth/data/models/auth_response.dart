
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  AuthResponse({this.message, this.userData, this.status, this.code});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}
@JsonSerializable()

class UserData {
  String? username;
  String? token;

  UserData({this.username, this.token});

  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
}