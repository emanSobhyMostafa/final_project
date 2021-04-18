import 'package:final_project/screens/card/counter_cart.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final product;
  final Function triggrtTotal;
  const CartItem({Key key, this.product, this.triggrtTotal}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  double value;
  @override
  void initState() {
    super.initState();
    value = (widget.product['price'] * widget.product['qty']);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                CachedImage(
                  imgurl: widget.product['image'],
                  height: 100,
                  width: 90,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.0, bottom: 2.0),
                            child: Center(
                                child: Text(
                              '${widget.product['price']} EGP',
                              textAlign: TextAlign.center,
                            )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.0, bottom: 2.0),
                            child: Center(
                                child: Text(
                              '${widget.product['category']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: CupertinoColors.inactiveGray),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                      child: Text(
                    'Total: ${value.toStringAsFixed(2)} EGP',
                    textAlign: TextAlign.center,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CounterView(
                    initNumber: widget.product['qty'],
                    counterCallback: (int val) {
                      setState(() {
                        value = widget.product['price'] * val;
                        widget.product['qty'] = val;
                        widget.triggrtTotal(value);
                      });
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
