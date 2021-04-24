import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:final_project/bloc/cart_bloc/cart_event.dart';
import 'package:final_project/bloc/main_bloc.dart';
import 'package:final_project/config/app_string.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/models/order_item.dart';
import 'package:final_project/repos/cart_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../models/product.dart';

Future<Map<String, Map<String, dynamic>>> getMainCategories() async {
  final mainCategoriesSnapshot = await FirebaseFirestore.instance
      .collection(AppString.MainCategories)
      .get();
  // print(mainCategoriesSnapshot.docs[0].data());
  // print("-------------------------------------------------------");
  Map<String, Map<String, dynamic>> allMainCategoriesData = {};
  mainCategoriesSnapshot.docs.forEach((item) {
    allMainCategoriesData.addAll({item.id: item.data()});
  });
  return allMainCategoriesData;
}

// fetch Home Screen Slider's Deals

Future<List<String>> getMainDeals() async {
  final mainDealsSnapshot =
      await FirebaseFirestore.instance.collection(AppString.MainDeals).get();

  List<String> allDealsData = [];
  mainDealsSnapshot.docs[0].data()['images'].forEach((item) {
    allDealsData.add(item);
  });
  print(allDealsData);
  print("-------------------------------------------------------");
  return allDealsData;
}

// fetch deals products

Future<List<Product>> getDeals() async {
  final dealsSnapshot = await FirebaseFirestore.instance
      .collection(AppString.DealProducts)
      .doc(AppString.DealsDoc)
      .collection(AppString.Products)
      .get();
  // print(categoriesSnapshot.docs[0]);
  // print("-------------------------------------------------------");
  List<Product> allDeals = [];
  dealsSnapshot.docs.forEach((item) {
    allDeals.add(productFromMap(item.data()));
  });
  return allDeals;
}

// fetch Categories

Future<List<String>> getAllCategories() async {
  final categoriesSnapshot =
      await FirebaseFirestore.instance.collection(AppString.Categories).get();
  // print(categoriesSnapshot.docs[0]);
  // print("-------------------------------------------------------");
  List<String> allCategoriesNames = [];
  categoriesSnapshot.docs.forEach((item) {
    allCategoriesNames.add(item.id);
  });
  return allCategoriesNames;
}

// fetch products

Future<List<Product>> getProducts(String categoryName) async {
  final productsSnapshot = await FirebaseFirestore.instance
      .collection(AppString.Categories)
      .doc(categoryName)
      .collection(AppString.Products)
      .get();
  // print(categoriesSnapshot.docs[0]);
  // print("-------------------------------------------------------");
  List<Product> allProducts = [];
  productsSnapshot.docs.forEach((item) {
    allProducts.add(productFromMap(item.data()));
  });
  return allProducts;
}

// favourites
Future<List<String>> getFavs() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return null;
  }
  String userId = user.uid;
  final favsSnapshot = await FirebaseFirestore.instance
      .collection(AppString.Favourites)
      .doc(userId)
      .get();
  // print(categoriesSnapshot.docs[0]);favs
  // print("-------------------------------------------------------");
  List<String> allFavs;

  allFavs = favsSnapshot.data() == null
      ? []
      : List<String>.from(favsSnapshot.data()['favs'] ?? []);
  await Hive.box(AppString.LocalMemory).put("favs", allFavs);

  return allFavs;
}

Future<void> toggleFavs(String prodId) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return null;
  }
  List<String> allFavs = Hive.box(AppString.LocalMemory).get("favs") ?? [];
  final isProductInFavs = allFavs.any((prod) => prodId == prod);
  if (isProductInFavs)
    allFavs.remove(prodId);
  else
    allFavs.add(prodId);
  await FirebaseFirestore.instance
      .collection(AppString.Favourites)
      .doc(user.uid)
      .set({"favs": allFavs});
  await Hive.box(AppString.LocalMemory).put("favs", allFavs);
}

Future<void> submitOrder(BuildContext context) async {
  final userId = FirebaseAuth.instance.currentUser.uid;
  final List<String> cartData =
      Hive.box(AppString.LocalMemory).get("cart") ?? [];
  final orderData = cartData.map((item) => cartItemFromJson(item)).toList();
  double total = 0.0;
  orderData.forEach((item) {
    total += item.count * item.product.price;
  });
  final order = OrderItem(
    time: DateTime.now(),
    total: total,
    orderData: orderData,
  );

  await FirebaseFirestore.instance
      .collection("allUsersOrders")
      .doc(userId)
      .collection("userOrder")
      .doc()
      .set(orderItemToMap(order));
  order.orderData.forEach((order) async {
    await deleteCartItem(context: context, product: order);
  });
  await Hive.box(AppString.LocalMemory).put("cart", <String>[]);
  BlocProvider.of<CartBloc>(context, listen: false).add(UpdateTotalInCart());
}

Future<List<OrderItem>> getAllUserOrders() async {
  List<OrderItem> allOrders;
  final user = FirebaseAuth.instance.currentUser;
  if (user == null ||
      FirebaseFirestore.instance
              .collection("allUsersOrders")
              .doc(user.uid)
              .collection("userOrder") ==
          null) {
    allOrders = [];
    return allOrders;
  }

  final ordersSnapshot = await FirebaseFirestore.instance
      .collection("allUsersOrders")
      .doc(user.uid)
      .collection("userOrder")
      .get();
  if (ordersSnapshot == null)
    allOrders = [];
  else {
    allOrders = ordersSnapshot.docs
        .map((item) => orderItemFromMap(item.data()))
        .toList();
  }
  return allOrders;
}
