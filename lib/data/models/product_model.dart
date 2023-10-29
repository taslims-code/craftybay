import 'dart:convert';

import 'package:ecommerce/data/models/product.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? msg;
  List<Product>? data;

  ProductModel({
    this.msg,
    this.data,
  });

  ProductModel copyWith({
    String? msg,
    List<Product>? data,
  }) =>
      ProductModel(
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
