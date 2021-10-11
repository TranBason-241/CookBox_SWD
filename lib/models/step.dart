class Step {
  Step({
    required this.id,
    required this.description,
    required this.repiceId,
  });

  int id;
  String description;
  int repiceId;

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