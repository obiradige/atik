import 'package:atik/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel extends BaseResponse {
  ProductDetailModel({
    required this.data,
    required super.message,
    required super.status,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);
  final BaseProductDetailModel data;
}

@JsonSerializable()
class BaseProductDetailModel {
  BaseProductDetailModel({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productUnit,
  });

  factory BaseProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BaseProductDetailModelFromJson(json);
  final String id;

  @JsonKey(name: 'product_name')
  final String productName;

  @JsonKey(name: 'product_image')
  final String productImage;

  @JsonKey(name: 'product_unit')
  final String productUnit;
}
