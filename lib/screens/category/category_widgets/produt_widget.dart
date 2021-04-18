import 'package:final_project/screens/card/cart_screen.dart';
import 'package:final_project/screens/product_details/product_details_screen.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final product;

  const Product({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                CachedImage(
                  imgurl: product.values.elementAt(5),
                  height: 100,
                  width: 90,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Text(
                                product.values.elementAt(1),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '${product.values.elementAt(2) * 15.6} EGP',
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '${product.values.elementAt(4)}',
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ), // getTextWidgets( post.results[index].title),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton(
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(Icons.shopping_cart),
                                  ),
                                  Text('Add To Cart')
                                ]),
                                onPressed: () {},
                              ),
                            ),
                            GestureDetector(
                              child: Icon(CupertinoIcons.heart),
                            )
                          ],
                        ), // getTextWidgets( post.results[index].title),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
