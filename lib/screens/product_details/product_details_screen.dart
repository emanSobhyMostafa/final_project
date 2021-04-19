import 'package:badges/badges.dart';
import 'package:final_project/screens/product_details/widgets/preview_button.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "details";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Name"),
        actions: [
          FlatButton(
            textColor: Colors.white,
            child: Badge(
              badgeContent: Text("3"),
              child: Icon(Icons.shopping_cart_rounded),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          CachedImage(
            imgurl:
                "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Text(
                  "Product Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "25\$",
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
                      "Product Description Product Description Product Description Product Description Product Description",
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
              onPressed: () {},
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}


