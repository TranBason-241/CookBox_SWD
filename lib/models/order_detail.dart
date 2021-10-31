// To parse this JSON data, do
//
//     final orderDetail = orderDetailFromJson(jsonString);

import 'dart:convert';

ResponceOrderDetail orderDetailFromJson(String str) =>
    ResponceOrderDetail.fromJson(json.decode(str));

String orderDetailToJson(ResponceOrderDetail data) => json.encode(data.toJson());

class ResponceOrderDetail {
  ResponceOrderDetail({
    this.metaData,
    this.items,
  });

  MetaData? metaData;
  List<OrderDetail>? items;

  factory ResponceOrderDetail.fromJson(Map<String, dynamic> json) => ResponceOrderDetail(
        metaData: MetaData.fromJson(json["metaData"]),
        items: List<OrderDetail>.from(json["items"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metaData": metaData!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class OrderDetail {
  OrderDetail({
    this.id,
    this.dishId,
    this.dishName,
    this.price,
    this.quantity,
  });

  int? id;
  int? dishId;
  String? dishName;
  // int? price;
  double? price;
  int? quantity;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        dishId: json["dish_id"],
        dishName: json["dish_name"],
        price: json["price"].toDouble(),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": id,
        "dish_id": dishId,
        "dish_name": dishName,
        "price": price,
        "quantity": quantity,
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
