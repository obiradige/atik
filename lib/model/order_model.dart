import 'package:atik/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends BaseResponse {
  OrderModel({
    required this.data,
    required super.status,
    required super.message,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  final List<BaseOrder> data;
}

@JsonSerializable()
class BaseOrder {
  BaseOrder({
    required this.userId,
    required this.orderKey,
    required this.customerInfo,
    required this.products,
    required this.address,
    required this.price,
    required this.date,
  });
  factory BaseOrder.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'order_key')
  final String orderKey;

  @JsonKey(name: 'customer_info')
  final CustomerInfo customerInfo;
  final List<OrderProductModel> products;
  final String address;
  final String price;
  final String date;
}

@JsonSerializable()
class CustomerInfo {
  CustomerInfo({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
  });
  factory CustomerInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoFromJson(json);

  final String name;
  final String surname;
  final String email;
  final String phone;
}

@JsonSerializable()
class OrderProductModel {
  OrderProductModel({
    required this.productId,
    required this.productName,
    required this.productField,
    required this.productPrice,
  });

  @JsonKey(name: 'product_id')
  final String productId;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'product_field')
  final int productField;
  @JsonKey(name: 'product_price')
  final double productPrice;

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
}
