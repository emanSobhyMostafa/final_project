import 'package:final_project/models/product.dart';
import 'dart:convert';

CartItem cartItemFromJson(String str) => CartItem.fromJson(json.decode(str));

String cartItemToJson(CartItem data) => json.encode(data.toJson());

class CartItem {
    CartItem({
        this.count,
        this.product,
    });

    int count;
    Product product;

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        count: json["count"],
        product: Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "product": product.toJson(),
    };

    void incremntCount() {
    this.count += 1;
  }

  void decremntCount() {
    if (this.count == 1) return;
    this.count -= 1;
  }
}


