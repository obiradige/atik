// To parse this JSON data, do
//
//     final customerInfo = customerInfoFromJson(jsonString);

import 'dart:convert';

CustomerInfo customerInfoFromJson(String str) => CustomerInfo.fromJson(json.decode(str));

String customerInfoToJson(CustomerInfo data) => json.encode(data.toJson());

class CustomerInfo {
    CustomerInfo({
        required this.data,
    });

    Data data;

    factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.walletId,
        required this.referenceCode,
        required this.qrCode,
        required this.status,
        required this.statusTranslate,
        required this.amount,
        required this.amountShow,
        required this.createdAt,
        required this.completedAt,
        required this.expiresAt,
        required this.campaign,
        required this.user,
    });

    int id;
    int walletId;
    int referenceCode;
    String qrCode;
    String status;
    String statusTranslate;
    String amount;
    String amountShow;
    DateTime createdAt;
    DateTime completedAt;
    DateTime expiresAt;
    List<dynamic> campaign;
    User user;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        walletId: json["wallet_id"],
        referenceCode: json["reference_code"],
        qrCode: json["qr_code"],
        status: json["status"],
        statusTranslate: json["status_translate"],
        amount: json["amount"],
        amountShow: json["amount_show"],
        createdAt: DateTime.parse(json["created_at"]),
        completedAt: DateTime.parse(json["completed_at"]),
        expiresAt: DateTime.parse(json["expires_at"]),
        campaign: List<dynamic>.from(json["campaign"].map((x) => x)),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "wallet_id": walletId,
        "reference_code": referenceCode,
        "qr_code": qrCode,
        "status": status,
        "status_translate": statusTranslate,
        "amount": amount,
        "amount_show": amountShow,
        "created_at": createdAt.toIso8601String(),
        "completed_at": completedAt.toIso8601String(),
        "expires_at": expiresAt.toIso8601String(),
        "campaign": List<dynamic>.from(campaign.map((x) => x)),
        "user": user.toJson(),
    };
}

class User {
    User({
        required this.uuid,
        required this.firstName,
        required this.lastName,
        required this.fullName,
        required this.email,
        required this.phone,
    });

    String uuid;
    String firstName;
    String lastName;
    String fullName;
    String email;
    String phone;

    factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "email": email,
        "phone": phone,
    };
}
