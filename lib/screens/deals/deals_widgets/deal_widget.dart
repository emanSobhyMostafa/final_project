import 'dart:math';

import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/models/product.dart';
import 'package:final_project/repos/cart_repo.dart';

import 'package:final_project/screens/category/category_widgets/fav_btn.dart';
import 'package:final_project/screens/product_details/product_details_screen.dart';
import 'package:final_project/widgets/cached_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealWidget extends StatelessWidget {
  final Product deal;

  const DealWidget({Key key, this.deal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int randomNum=0;
while (randomNum<deal.price){

     randomNum = Random().nextInt((1.8 * deal.price).toInt());
}

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
            arguments: {'prod': deal});
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                CachedImage(
                  imgurl: deal.images[0],
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
                                deal.enName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Previous Price: $randomNum EGP',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Current Price: ${deal.price} EGP',
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '${deal.enDes}',
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
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2),
                                      child: Icon(Icons.shopping_cart),
                                    ),
                                    Text('Add To Cart'),
                                  ],
                                ),
                                onPressed: () {
                                  addProdutInCart(
                                    product: deal,
                                    context: context,
                                  );
                                },
                              ),
                            ),
                            // FavBtn(product: deal)
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
