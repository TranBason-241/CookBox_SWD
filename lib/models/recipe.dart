import 'package:app/models/step.dart';

class Repice {
  Repice({
    required this.id,
    required this.dishId,
    required this.steps,
  });

  int id;
  int dishId;
  List<Step> steps;
  
  factory Repice.fromJson(Map<String, dynamic> json) => Repice(
        id: json["id"],
        dishId: json["dishId"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dishId": dishId,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}
