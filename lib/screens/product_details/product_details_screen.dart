import 'package:badges/badges.dart';
import 'package:final_project/models/product.dart';
import 'package:final_project/repos/cart_repo.dart';
import 'package:final_project/screens/product_details/widgets/preview_button.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProductDetailsScreen extends StatelessWidget {
  // final Product product;
  static const routeName = "details";

  // const ProductDetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arg = ModalRoute.of(context).settings.arguments;
    final Product product = arg['prod'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: MyAppBar(isFromHome: false, title: product.enName),
      ),
      body: Column(
        children: <Widget>[
          CachedImage(
            imgurl: product.images[0],
            fit: BoxFit.contain,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Text(
                  product.enName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${product.price} EGP",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    PreviewButton(),
                  ],
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      product.enDes,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),

                      //softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: RaisedButton.icon(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textColor: Colors.white,
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                size: 30,
              ),
              label: Text(
                "ADD TO  CART",
                style: TextStyle(fontSize: 20),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                addProdutInCart(
                  product: product,
                  context: context,
                );
              },
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
