class CategoryData {
  int? id;
  String? categoryName;
  String? categoryImg;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryData({
    this.id,
    this.categoryName,
    this.categoryImg,
    this.createdAt,
    this.updatedAt,
  });

  CategoryData copyWith({
    int? id,
    String? categoryName,
    String? categoryImg,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CategoryData(
        id: id ?? this.id,
        categoryName: categoryName ?? this.categoryName,
        categoryImg: categoryImg ?? this.categoryImg,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        categoryName: json["categoryName"],
        categoryImg: json["categoryImg"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "categoryImg": categoryImg,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
