class Product {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  double? star;
  String? remark;
  int? categoryId;
  int? brandId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic brand;
  dynamic category;

  Product({
    this.id,
    this.title,
    this.shortDes,
    this.price,
    this.discount,
    this.discountPrice,
    this.image,
    this.stock,
    this.star,
    this.remark,
    this.categoryId,
    this.brandId,
    this.createdAt,
    this.updatedAt,
    this.brand,
    this.category,
  });

  Product copyWith({
    int? id,
    String? title,
    String? shortDes,
    String? price,
    int? discount,
    String? discountPrice,
    String? image,
    int? stock,
    double? star,
    String? remark,
    int? categoryId,
    int? brandId,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic brand,
    dynamic category,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        shortDes: shortDes ?? this.shortDes,
        price: price ?? this.price,
        discount: discount ?? this.discount,
        discountPrice: discountPrice ?? this.discountPrice,
        image: image ?? this.image,
        stock: stock ?? this.stock,
        star: star ?? this.star,
        remark: remark ?? this.remark,
        categoryId: categoryId ?? this.categoryId,
        brandId: brandId ?? this.brandId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        brand: brand ?? this.brand,
        category: category ?? this.category,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        shortDes: json["short_des"],
        price: json["price"],
        discount: json["discount"],
        discountPrice: json["discount_price"],
        image: json["image"],
        stock: json["stock"],
        star: json["star"]?.toDouble(),
        remark: json["remark"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        brand: json["brand"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "short_des": shortDes,
        "price": price,
        "discount": discount,
        "discount_price": discountPrice,
        "image": image,
        "stock": stock,
        "star": star,
        "remark": remark,
        "category_id": categoryId,
        "brand_id": brandId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "brand": brand,
        "category": category,
      };
}
