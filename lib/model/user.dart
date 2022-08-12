import 'package:atik/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseResponse {
  User({required this.data, required super.status, required super.message});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  BaseUser data;
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class BaseUser {
  BaseUser(
      {required this.id,
      required this.municipalityId,
      required this.companyId,
      required this.username,
      required this.password,
      required this.name,
      required this.surname,
      required this.email,
      required this.auth,
      required this.location,
      required this.active});
  factory BaseUser.fromJson(Map<String, dynamic> json) =>
      _$BaseUserFromJson(json);

  final String id;
  @JsonKey(name: 'municipality_id')
  final String municipalityId;
  @JsonKey(name: 'company_id')
  final String companyId;
  final String username;
  final String password;
  final String name;
  final String surname;
  final String email;
  final String auth;
  final String location;
  final String active;

  Map<String, dynamic> toJson() => _$BaseUserToJson(this);
}
