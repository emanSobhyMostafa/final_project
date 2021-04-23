import 'dart:convert';

import 'package:final_project/config/app_string.dart';
import 'package:final_project/config/dumy_data.dart';
import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/models/product.dart';
import 'package:final_project/repos/cart_repo.dart';
import 'package:final_project/screens/cart/cart_items.dart';
import 'package:final_project/screens/cart/cart_payment.dart';
import 'package:final_project/screens/cart/counter_cart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<CartItem> allCartItems;
  @override
  initState() {
    super.initState();

    allCartItems = cartData.map((item) => cartItemFromJson(item)).toList();
    getTotal();
  }

  double total = 0.0;
  sum(CartItem prod) {
    return prod.count * prod.product.price;
  }

  getTotal() {
    for (var item in allCartItems) {
      total += sum(item);
    }
  }

  void incrementTotal(CartItem item) {
    total += item.product.price;
  }

  void decrementTotal(CartItem item) {
    total -= item.product.price;
  }

  void onDeletCartItem(CartItem item) {
    total -= item.count * item.product.price;
  }

  int _totalCartItems = Hive.box(AppString.LocalMemory).get("total") ?? 0;
  final List<String> cartData =
      Hive.box(AppString.LocalMemory).get("cart") ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _totalCartItems == 0
          ? Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: allCartItems.length,
                      itemBuilder: (ctx, index) {
                        return CartWidget(
                          item: allCartItems[index],
                          icrement: () {
                            setState(() {
                              incrementTotal(allCartItems[index]);
                            });
                          },
                          decrement: () {
                            setState(() {
                              decrementTotal(allCartItems[index]);
                            });
                          },
                          deletItem: () {
                            setState(() {
                              deleteCartItem(
                                  context: context,
                                  product: allCartItems[index]);

                              onDeletCartItem(allCartItems[index]);

                               _totalCartItems = Hive.box(AppString.LocalMemory).get("total") ?? 0;
  final List<String> cartData =
      Hive.box(AppString.LocalMemory).get("cart") ?? [];
          allCartItems = cartData.map((item) => cartItemFromJson(item)).toList();
                            });
                          },
                        );
                      }),
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ListTile(
                        title: new Text('Total:'),
                        subtitle: new Text('${total.toStringAsFixed(2)}'),
                      )),
                      Expanded(
                        child: new MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Checkout.routeName);
                          },
                          child: new Text(
                            'Proceed Check Out',
                            style: TextStyle(color: white),
                          ),
                          color: third,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
