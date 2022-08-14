// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedProductModel _$SelectedProductModelFromJson(
        Map<String, dynamic> json) =>
    SelectedProductModel(
      id: json['id'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productUnit: json['productUnit'] as String,
      count: (json['count'] as num).toDouble(),
    );

Map<String, dynamic> _$SelectedProductModelToJson(
        SelectedProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productUnit': instance.productUnit,
      'count': instance.count,
    };
