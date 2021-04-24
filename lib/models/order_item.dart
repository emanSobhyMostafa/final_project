import 'dart:convert';

import 'package:final_project/models/cart_item.dart';

OrderItem orderItemFromMap(Map<String, dynamic> order) =>
    OrderItem.fromMap(order);

Map<String, dynamic> orderItemToMap(OrderItem data) => data.toMap();

class OrderItem {
  DateTime time;
  double total;
  List<CartItem> orderData;
  OrderItem({this.orderData, this.time, this.total});

  factory OrderItem.fromMap(Map<String, dynamic> order) => OrderItem(
        total: order["total"],
        time: DateTime.parse(order["time"]),
        orderData: List<CartItem>.from(
            order["orderData"].map((x) => cartItemFromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "time": time.toIso8601String(),
        "orderData":
            List<dynamic>.from(orderData.map((item) => cartItemToJson(item)))
      };
}
