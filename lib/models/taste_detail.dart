class TasteDetail {
  TasteDetail({
    required this.id,
    required this.tasteName,
    required this.tasteLevel,
    required this.tasteId,
  });

  int id;
  String tasteName;
  int tasteLevel;
  int tasteId;

  factory TasteDetail.fromJson(Map<String, dynamic> json) => TasteDetail(
        id: json["id"],
        tasteName: json["tasteName"],
        tasteLevel: json["tasteLevel"],
        tasteId: json["tasteId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tasteName": tasteName,
        "tasteLevel": tasteLevel,
        "tasteId": tasteId,
      };
}