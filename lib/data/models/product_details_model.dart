// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecommerce/data/models/product_details.dart';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  String msg;
  List<ProductDetails> data;

  ProductDetailsModel({
    required this.msg,
    required this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        msg: json["msg"],
        data: List<ProductDetails>.from(
            json["data"].map((x) => ProductDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
