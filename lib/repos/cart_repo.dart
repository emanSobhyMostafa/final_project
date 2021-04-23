import 'package:final_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:final_project/bloc/cart_bloc/cart_event.dart';
import 'package:final_project/config/app_string.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

Future<void> addProdutInCart({Product product, BuildContext context}) async {
  final pref = Hive.box(AppString.LocalMemory);
  int total = pref.get("total") ?? 0;
  pref.put("total", total + 1);
  final List<String> cartData = pref.get("cart") ?? [];
  final allCartItems = cartData.map((item) => cartItemFromJson(item)).toList();
  final isProdInCart = allCartItems.any((item) {
    if (item.product.id == product.id) {
      item.incremntCount();
      return true;
    }
    return false;
  });
  if (!isProdInCart) {
    allCartItems.add(CartItem(count: 1, product: product));
  }
  await pref.put(
    "cart",
    allCartItems.map((item) => cartItemToJson(item)).toList(),
  );
  print(total);
  BlocProvider.of<CartBloc>(context, listen: false).add(UpdateTotalInCart());
  // await pref.clear();
}

Future<void> decremetnProductInCart(
    {CartItem product, BuildContext context}) async {
  if (product.count == 1) return;
  final pref = Hive.box(AppString.LocalMemory);
  int total = pref.get("total");
  pref.put("total", total - 1);
  final List<String> cartData = pref.get("cart");
  final allCartItems = cartData.map((item) => cartItemFromJson(item)).toList();
   allCartItems.any((item) {
    if (item.product.id == product.product.id) {
      item.decremntCount();
      return true;
    }
    return false;
  });
  // if (!isProdInCart) {
  //   allCartItems.add(CartItem(count: 1, product: product));
  // }
  await pref.put(
    "cart",
    allCartItems.map((item) => cartItemToJson(item)).toList(),
  );
  print(total);
  BlocProvider.of<CartBloc>(context, listen: false).add(UpdateTotalInCart());
  // await pref.clear();
}

Future<void> deleteCartItem(
    {CartItem product, BuildContext context}) async {
  final pref = Hive.box(AppString.LocalMemory);
  int total = pref.get("total");
  pref.put("total", total - product.count);
  final List<String> cartData = pref.get("cart");
  final allCartItems = cartData.map((item) => cartItemFromJson(item)).toList();
  //  allCartItems.any((item) {
  //   if (item.product.id == product.product.id) {
  //     item.decremntCount();
  //     return true;
  //   }
  //   return false;
  // });

  allCartItems.removeWhere((item)=>item.product.id == product.product.id);
  // if (!isProdInCart) {
  //   allCartItems.add(CartItem(count: 1, product: product));
  // }
  await pref.put(
    "cart",
    allCartItems.map((item) => cartItemToJson(item)).toList(),
  );
  print(total);
  BlocProvider.of<CartBloc>(context, listen: false).add(UpdateTotalInCart());
  // await pref.clear();
}
