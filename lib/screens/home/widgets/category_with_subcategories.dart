import 'package:final_project/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class CategoryWithSubcategories extends StatelessWidget {
  final String mainCategoryName;
  final List<Map<String, String>> subCategories;
  final int id;

  CategoryWithSubcategories({
    this.mainCategoryName,
    this.subCategories,
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(mainCategoryName),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) => Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      child: Text(subCategories[i].keys.first.toUpperCase()),
                    ),
                    Expanded(
                      child: ClipRRect(
                        child: CachedImage(
                          imgurl: subCategories[i].values.first,
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey.withOpacity(.5),
                        blurRadius: 4,
                        // spreadRadius: 1
                      )
                    ]),
                margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5,),
              ),
              itemCount: subCategories.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      height: MediaQuery.of(context).size.height*.25,
     
    );
  }
}
