import 'package:app/models/taste_detail.dart';

class Taste {
  Taste({
    required this.id,
    required this.dishId,
    required this.tasteDetails,
  });

  int id;
  int dishId;
  List<TasteDetail> tasteDetails;

  factory Taste.fromJson(Map<String, dynamic> json) => Taste(
        id: json["id"],
        dishId: json["dishId"],
        tasteDetails: List<TasteDetail>.from(
            json["tasteDetails"].map((x) => TasteDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dishId": dishId,
        "tasteDetails": List<dynamic>.from(tasteDetails.map((x) => x.toJson())),
      };
}
