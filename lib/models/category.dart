// To parse this JSON data, do
//
//     final categoryRespone = categoryResponeFromJson(jsonString);

import 'dart:convert';

CategoryRespone categoryResponeFromJson(String str) =>
    CategoryRespone.fromJson(json.decode(str));

String categoryResponeToJson(CategoryRespone data) =>
    json.encode(data.toJson());

class CategoryRespone {
  CategoryRespone({
    this.metaData,
    this.items,
  });

  MetaData? metaData;
  List<DishCategory>? items;

  factory CategoryRespone.fromJson(Map<String, dynamic> json) =>
      CategoryRespone(
        metaData: MetaData.fromJson(json["metaData"]),
        items: List<DishCategory>.from(
            json["items"].map((x) => DishCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metaData": metaData!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class DishCategory {
  DishCategory({this.id, this.name, this.status, this.isSelected = false});

  int? id;
  String? name;
  bool? status;
  bool isSelected;

  factory DishCategory.fromJson(Map<String, dynamic> json) => DishCategory(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
