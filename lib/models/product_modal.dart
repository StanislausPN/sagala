import 'dart:convert';

class ProductModal {
  final String productId;

  ProductModal(this.productId);
}

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((e) => Product.fromJson(e)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    // this.bucketName,
    // this.objectName,
    this.description,
    this.shortDescription,
    this.unit,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
    this.category,
    this.price,
  });

  String id;
  String name;
  // String bucketName;
  // String objectName;
  String description;
  String shortDescription;
  String unit;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;
  Category category;
  Price price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        // bucketName: json["bucket_name"],
        // objectName: json["object_name"],
        description: json["description"],
        shortDescription: json["shortDescription"],
        unit: json["unit"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        category: Category.fromJson(json["category"]),
        price: Price.fromJson(json["price"]),
      );

  static List<Product> parseList(List<dynamic> list) {
    return list.map((index) => Product.fromJson(index)).toList();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "bucket_name": bucketName,
        // "object_name": objectName,
        "description": description,
        "shortDescription": shortDescription,
        "unit": unit,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        // "deleted_at": deletedAt,
        "category": category.toJson(),
        "price": price.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.bucketName,
    this.objectName,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
  });

  String id;
  String name;
  String bucketName;
  String objectName;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        bucketName: json["bucket_name"],
        objectName: json["object_name"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bucket_name": bucketName,
        "object_name": objectName,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        // "deleted_at": deletedAt,
      };
}

class Price {
  Price({
    this.id,
    this.amount,
    this.amountWithDiscount,
    this.stock,
    this.minQty,
    this.productId,
    this.districtCode,
    this.isSpecialPromo,
    // this.type,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
  });

  String id;
  int amount;
  int amountWithDiscount;
  int stock;
  int minQty;
  String productId;
  String districtCode;
  bool isSpecialPromo;
  // String type;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json["id"],
        amount: json["amount"],
        amountWithDiscount: json["amountWithDiscount"],
        stock: json["stock"],
        minQty: json["minQty"],
        productId: json["productId"],
        districtCode: json["district_code"],
        isSpecialPromo: json["is_special_promo"],
        // type: json["type"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "amountWithDiscount": amountWithDiscount,
        "stock": stock,
        "minQty": minQty,
        "productId": productId,
        "district_code": districtCode,
        "is_special_promo": isSpecialPromo,
        // "type": type,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        // "deleted_at": deletedAt,
      };
}

class GetProduct {
  String id;
  String name;
  int price;
  int qty;

  GetProduct({
    this.id,
    this.name,
    this.price,
    this.qty,
  });

  factory GetProduct.fromJson(Map<String, dynamic> json) {
    return GetProduct(
      id: json['id'],
      name: json['nama'],
      price: json['harga'],
      qty: json['qty'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': name,
      'harga': price,
      'qty': qty,
    };
  }
}
