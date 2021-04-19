import 'package:final_project/screens/cart/counter_cart.dart';
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
        child: SizedBox(
          width: double.infinity,
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
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.product['price']} EGP',
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Total: ${value.toStringAsFixed(2)} EGP',
                    ),
                  ],
                ),
                Spacer(),
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
            ),
          ),
        ),
      ),
    );
  }
}
