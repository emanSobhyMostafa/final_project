import 'package:final_project/config/dumy_data.dart';
import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/screens/card/cart_items.dart';
import 'package:final_project/screens/card/cart_payment.dart';
import 'package:final_project/screens/card/counter_cart.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: testProducts.length,
                itemBuilder: (ctx, index) {
                  final product = testProducts[index];

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CartItem(product: product),
                    ],
                  );
                }))
      ]),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text('Total:'),
              subtitle: new Text('\$230'),
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
            ))
          ],
        ),
      ),
    );
  }
}
