// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecommerce/data/models/cart_data.dart';

Cart cartModelFromJson(String str) => Cart.fromJson(json.decode(str));

String cartModelToJson(Cart data) => json.encode(data.toJson());

class Cart {
  String? msg;
  List<CartData>? data;

  Cart({
    this.msg,
    this.data,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<CartData>.from(
                json["data"]!.map((x) => CartData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
