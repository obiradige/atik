import 'package:json_annotation/json_annotation.dart';

part 'selected_product_model.g.dart';

@JsonSerializable()
class SelectedProductModel {
  SelectedProductModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productUnit,
    required this.count,
  });

  factory SelectedProductModel.fromJson(Map<String, dynamic> json) =>
      _$SelectedProductModelFromJson(json);
  final String id;
  final String productName;
  final double productPrice;
  final String productUnit;
  final double count;

  Map<String, dynamic> toJson() => _$SelectedProductModelToJson(this);
}
