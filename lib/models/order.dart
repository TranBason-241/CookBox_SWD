// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.metaData,
    this.items,
  });

  MetaData? metaData;
  List<Item>? items;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        metaData: MetaData.fromJson(json["metaData"]),
        items: List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metaData": metaData!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.date,
    this.paymentName,
    this.paymentId,
    this.userId,
    this.storeId,
    this.userName,
    this.storeName,
    this.total,
    this.orderStatus,
    this.orderDetails,
  });

  int? id;
  DateTime? date;
  String? paymentName;
  String? paymentId;
  int? userId;
  int? storeId;
  String? userName;
  String? storeName;
  int? total;
  String? orderStatus;
  List<dynamic>? orderDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        paymentName: json["payment_name"],
        paymentId: json["paymentId"],
        userId: json["userId"],
        storeId: json["storeId"],
        userName: json["user_name"],
        storeName: json["store_name"],
        total: json["total"],
        orderStatus: json["order_status"],
        orderDetails: List<dynamic>.from(json["orderDetails"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date!.toIso8601String(),
        "payment_name": paymentName,
        "paymentId": paymentId,
        "userId": userId,
        "storeId": storeId,
        "user_name": userName,
        "store_name": storeName,
        "total": total,
        "order_status": orderStatus,
        "orderDetails": List<dynamic>.from(orderDetails!.map((x) => x)),
      };
}

class MetaData {
  MetaData({
     this.currentPage,
     this.totalPages,
     this.pageSize,
     this.totalCount,
     this.hasPrevious,
     this.hasNext,
     this.firstPage,
     this.lastPage,
  });

  int? currentPage;
  int? totalPages;
  int? pageSize;
  int? totalCount;
  bool? hasPrevious;
  bool? hasNext;
  String? firstPage;
  String? lastPage;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        pageSize: json["pageSize"],
        totalCount: json["totalCount"],
        hasPrevious: json["hasPrevious"],
        hasNext: json["hasNext"],
        firstPage: json["firstPage"],
        lastPage: json["lastPage"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalPages": totalPages,
        "pageSize": pageSize,
        "totalCount": totalCount,
        "hasPrevious": hasPrevious,
        "hasNext": hasNext,
        "firstPage": firstPage,
        "lastPage": lastPage,
      };
}
