import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/order_item.dart';
import 'package:final_project/screens/product_details/product_details_screen.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  final OrderItem order;

  const Order({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShowOrderItem(order);
  }
}

class ShowOrderItem extends StatefulWidget {
  final OrderItem order;

  const ShowOrderItem(this.order);

  @override
  _ShowOrderItemState createState() => _ShowOrderItemState();
}

class _ShowOrderItemState extends State<ShowOrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Total: ${widget.order.total} EGP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                DateFormat('dd/MM/yyyy \nhh:mm').format(widget.order.time)),
            //  Text(.toString()),
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
                maxHeight: _expanded ? max(2 * 130.0, 100.0) : 0),

            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //height: min(widget.order.products.length *50.0,110.0),
            child: ListView(children: [
              ...widget.order.orderData
                  .map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CachedImage(
                              width: 80,
                              height: 80,
                              imgurl: item.product.images[0],
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                item.product.enName,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${item.product.price} x ${item.count}",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Payed In Cash",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 45,
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
