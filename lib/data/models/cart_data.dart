import 'package:ecommerce/data/models/product.dart';

class CartData {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  String? qty;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  CartData({
    this.id,
    this.userId,
    this.productId,
    this.color,
    this.size,
    this.qty,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        color: json["color"],
        size: json["size"],
        qty: json["qty"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "color": color,
        "size": size,
        "qty": qty,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
      };
}
