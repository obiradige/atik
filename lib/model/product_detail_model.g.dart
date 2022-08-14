// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      data:
          BaseProductDetailModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      status: json['status'] as String,
    );

// ignore: unused_element
Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BaseProductDetailModel _$BaseProductDetailModelFromJson(
        Map<String, dynamic> json) =>
    BaseProductDetailModel(
      id: json['id'] as String,
      productName: json['product_name'] as String,
      productImage: json['product_image'] as String,
      productUnit: json['product_unit'] as String,
    );

// ignore: unused_element
Map<String, dynamic> _$BaseProductDetailModelToJson(
        BaseProductDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'product_unit': instance.productUnit,
    };
