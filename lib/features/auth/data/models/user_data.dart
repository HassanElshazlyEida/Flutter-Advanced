import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';
@JsonSerializable()

class UserData {
  final String? username;

  const UserData({required this.username});

  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
}