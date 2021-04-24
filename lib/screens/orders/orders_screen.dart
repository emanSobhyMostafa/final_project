import 'package:badges/badges.dart';
import 'package:final_project/models/order_item.dart';
import 'package:final_project/screens/orders/orders_widgets/order_widget.dart';
import 'package:final_project/services/service.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: MyAppBar(isFromHome: false, title: "Your Orders"),
      ),
      body: FutureBuilder<List<OrderItem>>(
          future: getAllUserOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasError) throw snapshot.error;
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            if (snapshot.data.isEmpty)
              return Center(child: Text("No Orders To show"));
            final orders = snapshot.data;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (ctx, index) {
                final order = orders[index];

                return Order(order: order);
              },
            );
          }),
    );
  }
}
