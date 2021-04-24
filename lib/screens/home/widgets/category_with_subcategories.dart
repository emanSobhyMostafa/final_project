import 'package:final_project/config/app_string.dart';
import 'package:final_project/screens/category/category.dart';
import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class CategoryWithSubcategories extends StatelessWidget {
  final String mainCategoryName;
  final Map<String, dynamic> subCategoriesData;
  // final int id;

  CategoryWithSubcategories({
    this.mainCategoryName,
    this.subCategoriesData,
    // this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              mainCategoryName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Category(
                            categoryName:
                                subCategoriesData[AppString.Categories][i],
                          )));
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Text(
                          subCategoriesData[AppString.Categories][i]
                              .split("-")[0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          child: CachedImage(
                            imgurl: subCategoriesData[AppString.Images][i],
                            height: 100,
                            width: 150,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 4,
                          // spreadRadius: 1
                        )
                      ]),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                ),
              ),
              itemCount: subCategoriesData[AppString.Images].length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      height: MediaQuery.of(context).size.height * .25,
      padding: EdgeInsets.symmetric(vertical: 10),
    );
  }
}
