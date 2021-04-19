import 'dart:math';

import 'package:final_project/screens/product_details/product_details_screen.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  final order;

  const Order({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    return ShowOrderItem(order);
  }
}

class ShowOrderItem extends StatefulWidget {
  ShowOrderItem(order);

  @override
  _ShowOrderItemState createState() => _ShowOrderItemState();
}

class _ShowOrderItemState extends State<ShowOrderItem> {
  
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
     DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "${(109.95*15.6*2)+(22.3*15.6)} EGP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(date.toString()),
            trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                }),
          ),
          //if (_expanded)
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            constraints: BoxConstraints(
                maxHeight: _expanded ? min(2 * 50.0, 100.0) : 0),

            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //height: min(widget.order.products.length *50.0,110.0),
            child: ListView(
              children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Backpack",
                            style: TextStyle(
                                fontSize: 18, ),
                          ),
                          Text(
                            "${109.95*15.6} x ${2}",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "T-Shirt",
                            style: TextStyle(
                                fontSize: 18, ),
                          ),
                          Text(
                            "${22.3*15.6} x ${1}",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                            ]
                 
            ),
          )
        ],
      ),
    );
  }
}


