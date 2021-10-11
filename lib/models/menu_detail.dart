// To parse this JSON data, do
//
//     final dishTest = dishTestFromJson(jsonString);

import 'dart:convert';

MenuDetail dishTestFromJson(String str) => MenuDetail.fromJson(json.decode(str));

String dishTestToJson(MenuDetail data) => json.encode(data.toJson());

class MenuDetail {
  MenuDetail({
    required this.metaData,
    required this.items,
  });

  MetaData metaData;
  List<Item> items;

  factory MenuDetail.fromJson(Map<String, dynamic> json) => MenuDetail(
        metaData: MetaData.fromJson(json["metaData"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metaData": metaData.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.price,
    // required this.description,
    // required this.categoryName,
    // required this.status,
    // required this.nutrientDes,
    required this.image,
  });

  int id;
  String name;
  double price;
  // String description;
  // String categoryName;
  // bool status;
  
  // String nutrientDes;
  String image;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['dish']["id"],
        name: json['dish']["name"],
        price: json["price"],
        image: json['dish']["image"],
        // description: json["description"],
        // categoryName: json["categoryName"],
        // status: json["status"],
        // nutrientDes: json["nutrient_des"] == null ? null : json["nutrient_des"],
        // image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        // "description": description,
        // "categoryName": categoryName,
        // "status": status,
        // "nutrient_des": nutrientDes == null ? null : nutrientDes,
        "image": image == null ? null : image,
      };
}

// class Repice {
//   Repice({
//     required this.id,
//     required this.dishId,
//     required this.steps,
//   });

//   int id;
//   int dishId;
//   List<Step> steps;

//   factory Repice.fromJson(Map<String, dynamic> json) => Repice(
//         id: json["id"],
//         dishId: json["dishId"],
//         steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "dishId": dishId,
//         "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
//       };
// }

// class Step {
//   Step({
//     required this.id,
//     required this.description,
//     required this.repiceId,
//   });

//   int id;
//   String description;
//   int repiceId;

//   factory Step.fromJson(Map<String, dynamic> json) => Step(
//         id: json["id"],
//         description: json["description"],
//         repiceId: json["repiceId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "description": description,
//         "repiceId": repiceId,
//       };
// }

// class Taste {
//   Taste({
//     required this.id,
//     required this.dishId,
//     required this.tasteDetails,
//   });

//   int id;
//   int dishId;
//   List<TasteDetail> tasteDetails;

//   factory Taste.fromJson(Map<String, dynamic> json) => Taste(
//         id: json["id"],
//         dishId: json["dishId"],
//         tasteDetails: List<TasteDetail>.from(
//             json["tasteDetails"].map((x) => TasteDetail.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "dishId": dishId,
//         "tasteDetails": List<dynamic>.from(tasteDetails.map((x) => x.toJson())),
//       };
// }

// class TasteDetail {
//   TasteDetail({
//     required this.id,
//     required this.tasteName,
//     required this.tasteLevel,
//     required this.tasteId,
//   });

//   int id;
//   String tasteName;
//   int tasteLevel;
//   int tasteId;

//   factory TasteDetail.fromJson(Map<String, dynamic> json) => TasteDetail(
//         id: json["id"],
//         tasteName: json["tasteName"],
//         tasteLevel: json["tasteLevel"],
//         tasteId: json["tasteId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "tasteName": tasteName,
//         "tasteLevel": tasteLevel,
//         "tasteId": tasteId,
//       };
// }

class MetaData {
  MetaData({
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
    required this.totalCount,
    required this.hasPrevious,
    required this.hasNext,
    required this.nextPage,
    required this.firstPage,
    required this.lastPage,
  });

  int currentPage;
  int totalPages;
  int pageSize;
  int totalCount;
  bool hasPrevious;
  bool hasNext;
  String nextPage;
  String firstPage;
  String lastPage;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        pageSize: json["pageSize"],
        totalCount: json["totalCount"],
        hasPrevious: json["hasPrevious"],
        hasNext: json["hasNext"],
        nextPage: json["nextPage"],
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
        "nextPage": nextPage,
        "firstPage": firstPage,
        "lastPage": lastPage,
      };
}
