import 'package:atik/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';


part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseResponse {
  ProductModel({
    required this.data,
    required super.status,
    required super.message,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  final List<BaseProductModel> data;
}

@JsonSerializable()
class BaseProductModel {
  BaseProductModel({
    required this.id,
    required this.municipalityId,
    required this.companyId,
    required this.productId,
    required this.price,
  });

  factory BaseProductModel.fromJson(Map<String, dynamic> json) =>
      _$BaseProductModelFromJson(json);
  final String id;

  @JsonKey(name: 'municipality_id')
  final String municipalityId;

  @JsonKey(name: 'company_id')
  final String companyId;

  @JsonKey(name: 'product_id')
  final String productId;

  final String price;

  Map<String, dynamic> toJson() => _$BaseProductModelToJson(this);
}
