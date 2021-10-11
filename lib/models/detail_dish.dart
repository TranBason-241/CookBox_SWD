// To parse this JSON data, do
//
//     final dishResponse = dishResponseFromJson(jsonString);

import 'dart:convert';

DishResponse dishResponseFromJson(String str) => DishResponse.fromJson(json.decode(str));

String dishResponseToJson(DishResponse data) => json.encode(data.toJson());

class DishResponse {
    DishResponse({
        this.id,
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
        this.tastes,
    });

    int? id;
    String? name;
    String? description;
    String? image;
    int? categoryId;
    String? categoryName;
    bool? status;
    int? parentId;
    double? price;
    List<dynamic>? dishIngredients;
    List<dynamic>? nutrientDetails;
    List<Repice>? repices;
    List<Taste>? tastes;

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
        dishIngredients: List<dynamic>.from(json["dishIngredients"].map((x) => x)),
        nutrientDetails: List<dynamic>.from(json["nutrientDetails"].map((x) => x)),
        repices: List<Repice>.from(json["repices"].map((x) => Repice.fromJson(x))),
        tastes: List<Taste>.from(json["tastes"].map((x) => Taste.fromJson(x))),
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
        "dishIngredients": List<dynamic>.from(dishIngredients!.map((x) => x)),
        "nutrientDetails": List<dynamic>.from(nutrientDetails!.map((x) => x)),
        "repices": List<dynamic>.from(repices!.map((x) => x.toJson())),
        "tastes": List<dynamic>.from(tastes!.map((x) => x.toJson())),
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

class Taste {
    Taste({
        this.id,
        this.dishId,
        this.name,
        this.tasteDetails,
    });

    int? id;
    int? dishId;
    String? name;
    List<dynamic>? tasteDetails;

    factory Taste.fromJson(Map<String, dynamic> json) => Taste(
        id: json["id"],
        dishId: json["dishId"],
        name: json["name"],
        tasteDetails: List<dynamic>.from(json["tasteDetails"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dishId": dishId,
        "name": name,
        "tasteDetails": List<dynamic>.from(tasteDetails!.map((x) => x)),
    };
}
