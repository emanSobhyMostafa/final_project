import 'package:final_project/bloc/main_bloc.dart';
import 'package:final_project/bloc/main_state.dart';
import 'package:final_project/screens/home/widgets/main_categories.dart';
import 'package:final_project/screens/home/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMain extends StatelessWidget {
  static const routeName = "home";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      builder: (_, state) {
        if (state is WaitingState)
          return Center(child: CircularProgressIndicator());
        else if (state is SuccessState)
          return SingleChildScrollView(
            child: Column(
              children: [
                ImageSliderDemo(),
                MainCategories(),
              ],
            ),
          );
        else
          return Center(child: Text("Error"));
      },
      listener: (_, state) {},
    );
  }
}
