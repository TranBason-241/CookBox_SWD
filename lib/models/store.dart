// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  Store({
    this.metaData,
    this.items,
  });

  MetaData? metaData;
  List<Item>? items;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        metaData: MetaData.fromJson(json["metaData"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metaData": metaData!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.address,
    this.status,
    // this.distance
  });

  int? id;
  String? name;
  String? address;
  bool? status;
  // double? distance;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "status": status,
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
    this.currentPageUri,
    this.firstPage,
    this.lastPage,
  });

  int? currentPage;
  int? totalPages;
  int? pageSize;
  int? totalCount;
  bool? hasPrevious;
  bool? hasNext;
  String? currentPageUri;
  String? firstPage;
  String? lastPage;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        pageSize: json["pageSize"],
        totalCount: json["totalCount"],
        hasPrevious: json["hasPrevious"],
        hasNext: json["hasNext"],
        currentPageUri: json["currentPageUri"],
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
        "currentPageUri": currentPageUri,
        "firstPage": firstPage,
        "lastPage": lastPage,
      };
}
