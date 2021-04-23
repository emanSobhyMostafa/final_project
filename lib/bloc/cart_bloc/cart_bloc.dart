import 'package:final_project/bloc/cart_bloc/cart_event.dart';
import 'package:final_project/bloc/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<UpdateTotalInCart, TotalInCartState> {
  CartBloc() : super(TotalInCartState(DateTime.now()));

  @override
  Stream<TotalInCartState> mapEventToState(UpdateTotalInCart event) async* {
    yield TotalInCartState(DateTime.now());
  }
}
