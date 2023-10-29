// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecommerce/data/models/category_data.dart';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String? msg;
  List<CategoryData>? data;

  CategoryModel({
    this.msg,
    this.data,
  });

  CategoryModel copyWith({
    String? msg,
    List<CategoryData>? data,
  }) =>
      CategoryModel(
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<CategoryData>.from(
                json["data"]!.map((x) => CategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
