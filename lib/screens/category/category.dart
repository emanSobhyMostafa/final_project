import 'dart:convert';

import 'package:final_project/config/dumy_data.dart';
import 'package:final_project/screens/category/category_bloc/category_bloc.dart';
import 'package:final_project/screens/category/category_bloc/category_event.dart';
import 'package:final_project/screens/category/category_bloc/category_state.dart';
import 'package:final_project/screens/category/category_widgets/produt_widget.dart';
import 'package:final_project/screens/category/category_widgets/sort_widget.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category extends StatelessWidget {
  final String categoryName;

  const Category({Key key, this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext _) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: MyAppBar(isFromHome: false, title: categoryName.split('-')[0]),
        ),
        body: BlocProvider<CategoryBloc>(
        create: (_) => CategoryBloc(categoryName)..add(GetDataEvent()),
        child: BlocConsumer<CategoryBloc, CategoryState>(
          builder: (context, state) {
            final categoryProducts =
        BlocProvider.of<CategoryBloc>(context, listen: false).state.categoryProducts;
            if (state is WaitingState)
              return Center(child: CircularProgressIndicator());
            else if (state is SuccessState)
              return Column(
                children: [
                  SortWidget(count:categoryProducts.length),
                  Expanded(
                    child: ListView.builder(
                      itemCount: categoryProducts.length,
                      itemBuilder: (ctx, index) {
                        return ProductWidget(product: categoryProducts[index]);
                      },
                    ),
                  )
                ],
              );
            else
              return Center(child: Text("Error"));
          },
          listener: (_, state) {},
        ),
      ),);
  }
}
