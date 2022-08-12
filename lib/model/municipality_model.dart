import 'package:atik/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'municipality_model.g.dart';

@JsonSerializable()
class MunicipalityModel extends BaseResponse {
  MunicipalityModel({
    required this.data,
    required super.status,
    required super.message,
  });
  factory MunicipalityModel.fromJson(Map<String, dynamic> json) =>
      _$MunicipalityModelFromJson(json);
  final BaseMunicipalityModel data;

  Map<String, dynamic> toJson() => _$MunicipalityModelToJson(this);
}

@JsonSerializable()
class BaseMunicipalityModel {
  BaseMunicipalityModel({
    required this.id,
    required this.municipalityName,
    required this.image,
    required this.cardImage,
    required this.active,
  });

  factory BaseMunicipalityModel.fromJson(Map<String, dynamic> json) =>
      _$BaseMunicipalityModelFromJson(json);
  final String id;
  @JsonKey(name: 'municipality_name')
  final String municipalityName;
  final String image;
  @JsonKey(name: 'card_image')
  final String cardImage;
  final String active;

  Map<String, dynamic> toJson() => _$BaseMunicipalityModelToJson(this);
}
