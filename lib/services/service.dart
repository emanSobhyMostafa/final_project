import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/config/app_string.dart';

Future<Map<String, Map<String, dynamic>>> getMainCategories() async {
  final mainCategoriesSnapshot = await FirebaseFirestore.instance
      .collection(AppString.MainCategories)
      .get();
  print(mainCategoriesSnapshot.docs[0].data());
  print("-------------------------------------------------------");
  Map<String, Map<String, dynamic>> allMainCategoriesData = {};
  mainCategoriesSnapshot.docs.forEach((item) {
    allMainCategoriesData.addAll({item.id: item.data()});
  });
  return allMainCategoriesData;
}
