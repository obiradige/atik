// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      data: BaseUser.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BaseUser _$BaseUserFromJson(Map<String, dynamic> json) => BaseUser(
      id: json['id'] as String,
      municipalityId: json['municipality_id'] as String,
      companyId: json['company_id'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      auth: json['auth'] as String,
      location: json['location'] as String,
      active: json['active'] as String,
    );

Map<String, dynamic> _$BaseUserToJson(BaseUser instance) => <String, dynamic>{
      'id': instance.id,
      'municipality_id': instance.municipalityId,
      'company_id': instance.companyId,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'auth': instance.auth,
      'location': instance.location,
      'active': instance.active,
    };
