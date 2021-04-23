import 'package:final_project/screens/cart/cart_payment.dart';
import 'package:final_project/screens/cart/method_confirmation_screen.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/config/theme_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartPaymentMethodScreen extends StatelessWidget {
  static const routeName = 'payment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar(isFromHome: false, title:'CheckOut', height: 120,),
      body: Container(
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
                  elevation: 10.0,

          child:
        
           Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your Address.',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFAB47BC) , width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFAB47BC), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
],
                    decoration: InputDecoration(
                      hintText: 'Enter your Phone Number.',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: primary , width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color:primary, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(children: [
                    RaisedButton.icon(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textColor: Colors.white,
              icon: Icon(
                Icons.credit_card,
                size: 30,
              ),
              label: Text(
                "Credit Card",
                style: TextStyle(fontSize: 20),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                               Navigator.pushNamed(context, Checkout.routeName);

              },
            ),
            Spacer(),
            RaisedButton.icon(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textColor: Colors.white,
              icon: Icon(
                Icons.money,
                size: 30,
              ),
              label: Text(
                "Cash on Delivery",
                style: TextStyle(fontSize: 20),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OrderConfirmationScreen(
                             
                            )));
              },
            ),
                  ],)
              ],
          ),
           ),
        ),
      ),
    );
  }
}

