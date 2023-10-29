import 'package:ecommerce/data/models/product.dart';

class ProductDetails {
  int? id;
  String? img1;
  String? img2;
  String? img3;
  String? img4;
  String? des;
  String? color;
  String? size;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  ProductDetails({
    this.id,
    this.img1,
    this.img2,
    this.img3,
    this.img4,
    this.des,
    this.color,
    this.size,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["id"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        img4: json["img4"],
        des: json["des"],
        color: json["color"],
        size: json["size"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img1": img1,
        "img2": img2,
        "img3": img3,
        "img4": img4,
        "des": des,
        "color": color,
        "size": size,
        "product_id": productId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
      };
}
