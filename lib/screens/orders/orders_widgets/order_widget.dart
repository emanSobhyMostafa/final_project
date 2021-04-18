import 'package:final_project/screens/product_details/product_details_screen.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  final  order;

  const Order({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
      },
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                
                children: [
                  CachedImage(
                    imgurl: order.values.elementAt(4),
                    height: 70,
                    width: 50,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Text(
                                  order.values.elementAt(1),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                          

                         
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child:  Text(
                              'Order Id: ${order.values.elementAt(0)}',
                              style:
                                  TextStyle(color: CupertinoColors.inactiveGray),
                            )),
                          
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Order Date: $date',
                              style:
                              TextStyle(color: CupertinoColors.inactiveGray),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Shipment fee: ${order.values.elementAt(5)} EGP',
                              textAlign: TextAlign.center,
                            ),
                          ), 
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Qty: ${order.values.elementAt(2)}',
                            ),
                          ),
                            Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Grand Total: ${(order.values.elementAt(3) * 15.6 * order.values.elementAt(2))+order.values.elementAt(5)} EGP',
                            
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
