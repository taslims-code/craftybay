class Profile {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? city;
  String? shippingAddress;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.city,
    this.shippingAddress,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobile: json["mobile"],
        city: json["city"],
        shippingAddress: json["shippingAddress"],
        email: json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
        "city": city,
        "shippingAddress": shippingAddress,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
