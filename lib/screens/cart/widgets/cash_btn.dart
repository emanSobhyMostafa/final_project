import 'package:final_project/screens/cart/method_confirmation_screen.dart';
import 'package:final_project/services/service.dart';
import 'package:flutter/material.dart';

class CashBtn extends StatefulWidget {
  const CashBtn({
    Key key,
  }) : super(key: key);

  @override
  _CashBtnState createState() => _CashBtnState();
}

class _CashBtnState extends State<CashBtn> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (_isLoading) return Center(child: CircularProgressIndicator());
    return RaisedButton.icon(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      onPressed: () async {
        setState(() => _isLoading = true);
        await submitOrder(context);
        setState(() => _isLoading = false);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Your order has been placed successfully!!"),
          duration: Duration(milliseconds: 3000),
        ));
       await Future.delayed(Duration(milliseconds: 3100));
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
      },
    );
  }
}
