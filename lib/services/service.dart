import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/config/app_string.dart';

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

Future<List<String>> getAllCategories() async {
  final categoriesSnapshot =
      await FirebaseFirestore.instance.collection(AppString.Categories).get();
  print(categoriesSnapshot.docs[0]);
  print("-------------------------------------------------------");
  List<String> allCategoriesNames = [];
  categoriesSnapshot.docs.forEach((item) {
    allCategoriesNames.add(item.id);
  });
  return allCategoriesNames;
}

Future<List<Product>> getProducts(String categoryName) async {
  final productsSnapshot =
      await FirebaseFirestore.instance.collection(AppString.Categories).doc(categoryName).collection(AppString.Products).get();
  // print(categoriesSnapshot.docs[0]);
  // print("-------------------------------------------------------");
  List<Product> allProducts = [];
  productsSnapshot.docs.forEach((item) {
    allProducts.add(productFromJson(item.data()));
  });
  return allProducts;
}
