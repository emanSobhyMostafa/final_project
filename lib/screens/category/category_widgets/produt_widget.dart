import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final product;

  const Product({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsScreen(prodId: prod.id,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: Row(

              children: [
                SizedBox(
                    height: 100, child: Image.network(product.values.elementAt(5))),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child:SizedBox(
                             
                                  width: MediaQuery.of(context).size.width * 0.65
                                  ,
                                  child: Text(
                                    product.values.elementAt(1),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                               
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Center(
                                child: Text(
                                  '${product.values.elementAt(2)*15.6} EGP',
                                  textAlign: TextAlign.center,
                                
                                )),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Center(
                                child: Text(
                                  '${product.values.elementAt(4)}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                      CupertinoColors.inactiveGray),
                                )),
                          ), // getTextWidgets( post.results[index].title),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Center(
                                    child: ElevatedButton(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8),
                                            child: Icon(Icons.shopping_cart),
                                          ),
                                          Text('Add To Cart')
                                          ]
                                          ),onPressed:(){

                                    },)),
                              ),
                              GestureDetector(child: Icon(CupertinoIcons.heart),)
                            ],
                          ), // getTextWidgets( post.results[index].title),

                        ],
                      ),

                    ],

                  ),
                ),

              ],
            )),
      ),
    );;
  }
}
