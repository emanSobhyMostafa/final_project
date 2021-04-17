import 'package:badges/badges.dart';
import 'package:final_project/screens/orders/orders_widgets/order_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final orders = [
{
"id": 1,
"title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
"qty":2,
"total": 109.95,
"image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
"fee":20
},{
"id": 2,
"title": "Mens Casual Premium Slim Fit T-Shirts ",
"qty":1,
"price": 22.3,
"image": "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
"fee":22
},
];
    return Scaffold(
      appBar:  AppBar(
        title: Text("My Orders"),
        actions: [
          FlatButton(
            textColor: Colors.white,
            child: Badge(
              badgeContent: Text("3"),
              child: Icon(Icons.shopping_cart_rounded),
            ),
            onPressed: () {},
          )
        ],
      ),
      body:  ListView.builder(
            itemCount: orders.length,
            itemBuilder: (ctx, index) {
              final order = orders[index];
             
              return Order(
                order:order
              );
            },
        ),
    );
  }
}