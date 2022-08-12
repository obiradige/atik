// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MunicipalityModel _$MunicipalityModelFromJson(Map<String, dynamic> json) =>
    MunicipalityModel(
      data:
          BaseMunicipalityModel.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MunicipalityModelToJson(MunicipalityModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BaseMunicipalityModel _$BaseMunicipalityModelFromJson(
        Map<String, dynamic> json) =>
    BaseMunicipalityModel(
      id: json['id'] as String,
      municipalityName: json['municipality_name'] as String,
      image: json['image'] as String,
      cardImage: json['card_image'] as String,
      active: json['active'] as String,
    );

Map<String, dynamic> _$BaseMunicipalityModelToJson(
        BaseMunicipalityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'municipality_name': instance.municipalityName,
      'image': instance.image,
      'card_image': instance.cardImage,
      'active': instance.active,
    };
