// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => BaseProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      message: json['message'] as String?,
    );

// ignore: unused_element
Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BaseProductModel _$BaseProductModelFromJson(Map<String, dynamic> json) =>
    BaseProductModel(
      id: json['id'] as String,
      municipalityId: json['municipality_id'] as String,
      companyId: json['company_id'] as String,
      productId: json['product_id'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$BaseProductModelToJson(BaseProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'municipality_id': instance.municipalityId,
      'company_id': instance.companyId,
      'product_id': instance.productId,
      'price': instance.price,
    };
