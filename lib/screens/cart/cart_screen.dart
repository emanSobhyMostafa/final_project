import 'dart:convert';

import 'package:final_project/config/dumy_data.dart';
import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/screens/cart/cart_items.dart';
import 'package:final_project/screens/cart/cart_payment.dart';
import 'package:final_project/screens/cart/cart_payment_method_screen.dart';
import 'package:final_project/screens/cart/counter_cart.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  initState() {
    super.initState();
    getTotal();
  }

  double total = 0.0;
  sum(prod) {
    return prod['qty'] * prod['price'];
  }

  getTotal() {
    for (var item in testProducts) {
      total += sum(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: testProducts.length,
                itemBuilder: (ctx, index) {
                  final product = testProducts[index];
                  return CartItem(
                    product: product,
                    triggrtTotal: (total) {
                      setState(() {
                        getTotal();
                      });
                    },
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text('Total:'),
              subtitle: new Text('${total.toStringAsFixed(3)}'),
            )),
            Expanded(
                child: new MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CartPaymentMethodScreen(
                             
                            )));
              },
              child: new Text(
                'Proceed To Check Out',
                style: TextStyle(color: white),
              ),
              color: third,
            ))
          ],
        ),
      ),
    );
  }
}
