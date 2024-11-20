import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';
@JsonSerializable()

class UserData {
  final String userName;

  const UserData({required this.userName});

  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
}