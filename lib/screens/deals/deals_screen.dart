

import 'package:final_project/screens/category/category_widgets/product_widget.dart';
import 'package:final_project/screens/category/category_widgets/sort_widget.dart';
import 'package:final_project/screens/deals/deals_bloc/deal_bloc.dart';
import 'package:final_project/screens/deals/deals_bloc/deal_state.dart';
import 'package:final_project/screens/deals/deals_bloc/deal_event.dart';
import 'package:final_project/screens/deals/deals_widgets/deal_widget.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext _) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: MyAppBar(isFromHome: false, title: 'Deals'),
        ),
        body: BlocProvider<DealBloc>(
        create: (_) => DealBloc()..add(GetDataEvent()),
        child: BlocConsumer<DealBloc, DealState>(
          builder: (context, state) {
            final dealProducts =
        BlocProvider.of<DealBloc>(context, listen: false).state.dealProducts;
            if (state is WaitingState)
              return Center(child: CircularProgressIndicator());
            else if (state is SuccessState)
              return Column(
                children: [
                  SortWidget(count:dealProducts.length),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dealProducts.length,
                      itemBuilder: (ctx, index) {
                        return DealWidget(deal: dealProducts[index]);
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
