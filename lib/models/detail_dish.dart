// To parse this JSON data, do
//
//     final dishResponse = dishResponseFromJson(jsonString);

import 'dart:convert';

DishResponse dishResponseFromJson(String str) =>
    DishResponse.fromJson(json.decode(str));

String dishResponseToJson(DishResponse data) => json.encode(data.toJson());

class DishResponse {
  DishResponse(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.categoryId,
      this.categoryName,
      this.status,
      this.parentId,
      this.price,
      this.dishIngredients,
      this.nutrientDetails,
      this.repices,
      this.tasteDetails,
      this.quantity = 0});

  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  String? categoryName;
  bool? status;
  int? parentId;
  double? price;
  List<DishIngredient>? dishIngredients;
  List<NutrientDetail>? nutrientDetails;
  List<Repice>? repices;
  List<TasteDetail>? tasteDetails;
  int? quantity;

  factory DishResponse.fromJson(Map<String, dynamic> json) => DishResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        status: json["status"],
        parentId: json["parent_id"],
        price: json["price"].toDouble(),
        dishIngredients: List<DishIngredient>.from(
            json["dish_ingredients"].map((x) => DishIngredient.fromJson(x))),
        nutrientDetails: List<NutrientDetail>.from(
            json["nutrient_details"].map((x) => NutrientDetail.fromJson(x))),
        repices:
            List<Repice>.from(json["repices"].map((x) => Repice.fromJson(x))),
        tasteDetails: List<TasteDetail>.from(
            json["taste_details"].map((x) => TasteDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "category_id": categoryId,
        "category_name": categoryName,
        "status": status,
        "parent_id": parentId,
        "price": price,
        "dish_ingredients":
            List<dynamic>.from(dishIngredients!.map((x) => x.toJson())),
        "nutrient_details":
            List<dynamic>.from(nutrientDetails!.map((x) => x.toJson())),
        "repices": List<dynamic>.from(repices!.map((x) => x.toJson())),
        "taste_details":
            List<dynamic>.from(tasteDetails!.map((x) => x.toJson())),
      };
}

class DishIngredient {
  DishIngredient({
    this.id,
    this.metarialId,
    this.metarialName,
    this.quantity,
    this.dishId,
  });

  int? id;
  int? metarialId;
  String? metarialName;
  int? quantity;
  int? dishId;

  factory DishIngredient.fromJson(Map<String, dynamic> json) => DishIngredient(
        id: json["id"],
        metarialId: json["metarial_id"],
        metarialName: json["metarial_name"],
        quantity: json["quantity"],
        dishId: json["dish_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "metarial_id": metarialId,
        "metarial_name": metarialName,
        "quantity": quantity,
        "dish_id": dishId,
      };
}

class NutrientDetail {
  NutrientDetail({
    this.id,
    this.nutrientId,
    this.nutrientName,
    this.dishId,
    this.amount,
  });

  int? id;
  int? nutrientId;
  String? nutrientName;
  int? dishId;
  int? amount;

  factory NutrientDetail.fromJson(Map<String, dynamic> json) => NutrientDetail(
        id: json["id"],
        nutrientId: json["nutrient_id"],
        nutrientName: json["nutrient_name"],
        dishId: json["dish_id"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nutrient_id": nutrientId,
        "nutrient_name": nutrientName,
        "dish_id": dishId,
        "amount": amount,
      };
}

class Repice {
  Repice({
    this.id,
    this.dishId,
    this.steps,
  });

  int? id;
  int? dishId;
  List<Step>? steps;

  factory Repice.fromJson(Map<String, dynamic> json) => Repice(
        id: json["id"],
        dishId: json["dishId"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dishId": dishId,
        "steps": List<dynamic>.from(steps!.map((x) => x.toJson())),
      };
}

class Step {
  Step({
    this.id,
    this.description,
    this.repiceId,
  });

  int? id;
  String? description;
  int? repiceId;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        id: json["id"],
        description: json["description"],
        repiceId: json["repiceId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "repiceId": repiceId,
      };
}

class TasteDetail {
  TasteDetail({
    this.id,
    this.tasteName,
    this.tasteLevel,
    this.tasteId,
    
  });

  int? id;
  String? tasteName;
  int? tasteLevel;
  int? tasteId;

  factory TasteDetail.fromJson(Map<String, dynamic> json) => TasteDetail(
        id: json["id"],
        tasteName: json["taste_name"],
        tasteLevel: json["taste_level"],
        tasteId: json["taste_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "taste_name": tasteName,
        "taste_level": tasteLevel,
        "taste_id": tasteId,
      };
}

// To parse this JSON data, do
//
//     final dishFind = dishFindFromJson(jsonString);


DishFind dishFindFromJson(String str) => DishFind.fromJson(json.decode(str));

String dishFindToJson(DishFind data) => json.encode(data.toJson());

class DishFind {
    DishFind({
        this.storeId,
        this.dishId,
        this.listTaste,
    });

    int? storeId;
    int? dishId;
    List<TasteDetail>? listTaste;

    factory DishFind.fromJson(Map<String, dynamic> json) => DishFind(
        storeId: json["store_id"],
        dishId: json["dish_id"],
        listTaste: List<TasteDetail>.from(json["list_taste"].map((x) => TasteDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "dish_id": dishId,
        "list_taste": List<dynamic>.from(listTaste!.map((x) => x.toJson())),
    };
}

