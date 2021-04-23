// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromMap(Map<String, dynamic> prod) => Product.fromMap(prod);
Map<String, dynamic> productToMap(Product data) => data.toJson();
//----------------------------------------
Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.enName,
    this.arDes,
    this.arName,
    this.enDes,
    this.images,
    this.price,
    this.video,
  });

  String id;
  String enName;
  String arDes;
  String arName;
  String enDes;
  List<String> images;
  double price;
  String video;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        enName: json["en_name"],
        arDes: json["ar_des"],
        arName: json["ar_name"],
        enDes: json["en_des"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"].toDouble(),
        video: json["video"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "en_name": enName,
        "ar_des": arDes,
        "ar_name": arName,
        "en_des": enDes,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "video": video,
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        enName: json["enName"],
        arDes: json["arDes"],
        arName: json["arName"],
        enDes: json["enDes"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"].toDouble(),
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "enName": enName,
        "arDes": arDes,
        "arName": arName,
        "enDes": enDes,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "video": video,
      };
}
