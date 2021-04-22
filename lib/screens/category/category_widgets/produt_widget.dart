import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/models/product.dart';
import 'package:final_project/screens/cart/cart_screen.dart';
import 'package:final_project/screens/product_details/product_details_screen.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,arguments: {'prod':product});
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                CachedImage(
                  imgurl: product.images[0],
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
                                product.enName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '${product.price} EGP',
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '${product.enDes}',
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ), // getTextWidgets( post.results[index].title),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: third,
                                  onPrimary: white,
                                ),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(Icons.shopping_cart),
                                  ),
                                  Text('Add To Cart'),
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
