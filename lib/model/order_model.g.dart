// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => BaseOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      message: json['message'] as String?,
    );

// ignore: unused_element
Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BaseOrder _$BaseOrderFromJson(Map<String, dynamic> json) => BaseOrder(
      userId: json['user_id'] as String,
      orderKey: json['order_key'] as String,
      customerInfo:
          CustomerInfo.fromJson(json['customer_info'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String,
      price: json['price'] as String,
      date: json['date'] as String,
    );

// ignore: unused_element
Map<String, dynamic> _$BaseOrderToJson(BaseOrder instance) => <String, dynamic>{
      'user_id': instance.userId,
      'order_key': instance.orderKey,
      'customer_info': instance.customerInfo,
      'products': instance.products,
      'address': instance.address,
      'price': instance.price,
      'date': instance.date,
    };

CustomerInfo _$CustomerInfoFromJson(Map<String, dynamic> json) => CustomerInfo(
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

// ignore: unused_element
Map<String, dynamic> _$CustomerInfoToJson(CustomerInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone': instance.phone,
    };

OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    OrderProductModel(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productField: json['product_field'] as int,
      productPrice: (json['product_price'] as num).toDouble(),
    );

// ignore: unused_element
Map<String, dynamic> _$OrderProductModelToJson(OrderProductModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_field': instance.productField,
      'product_price': instance.productPrice,
    };
