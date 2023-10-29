import 'package:ecommerce/data/models/profile.dart';

class Review {
  int? id;
  String? description;
  String? email;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Profile? profile;

  Review({
    this.id,
    this.description,
    this.email,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.profile,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        description: json["description"],
        email: json["email"],
        productId: json["product_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "email": email,
        "product_id": productId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile": profile?.toJson(),
      };
}
