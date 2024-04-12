class PackagesModel {
  int id;
  String? purchased;

  PackagesModel({
    required this.id,
    this.purchased,
  });

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
        id: json["id"],
        purchased: json["purchased"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "purchased": purchased,
      };
}
