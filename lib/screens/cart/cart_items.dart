import 'package:final_project/models/cart_item.dart';
import 'package:final_project/repos/cart_repo.dart';
import 'package:final_project/screens/cart/counter_cart.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  final CartItem item;
  final Function icrement;
  final Function decrement;
  final Function deletItem;
  const CartWidget({
    Key key,
    this.item,
    this.decrement,
    this.deletItem,
    this.icrement,
  }) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  double value;
  @override
  void initState() {
    super.initState();
    value = (widget.item.product.price * widget.item.count);
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
                  imgurl: widget.item.product.images[0],
                  height: 100,
                  width: 90,
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.product.enName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${widget.item.product.price} EGP',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CounterView(
                    initNumber: widget.item.count,
                    product: widget.item.product,
                    counterCallback: (int val) {
                      setState(() {
                        value = widget.item.product.price * val;
                        widget.item.count = val;

                        // widget.triggrtTotal(value);
                      });
                    },
                    cartItem: widget.item,
                    icrement: widget.icrement,
                    decrement: widget.decrement,
                    deletItem: widget.deletItem,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.deletItem();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
