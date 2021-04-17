import 'dart:convert';

import 'package:final_project/config/dumy_data.dart';
import 'package:final_project/screens/category/category_widgets/produt_widget.dart';
import 'package:final_project/screens/category/category_widgets/sort_widget.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: MyAppBar(isFromHome: false, title: 'Category'),
        ),
        body: Column(
          children: [
            SortWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: testProducts.length,
                itemBuilder: (ctx, index) {
                  final product = testProducts[index];

                  return Product(product: product);
                },
              ),
            )
          ],
        ));
  }
}
