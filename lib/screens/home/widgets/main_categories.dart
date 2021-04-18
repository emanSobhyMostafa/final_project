import 'package:final_project/screens/home/widgets/category_with_subcategories.dart';
import 'package:flutter/material.dart';

class MainCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryWithSubcategories(
          mainCategoryName: "Fashion",
          subCategories: fachoinCategories,
        ),
        CategoryWithSubcategories(
          mainCategoryName: "House",
          subCategories: housCategories,
        ),
      ],
    );
  }

  static const fachoinCategories = [
    {
      "MEN'S APPAREL":
          "https://m.media-amazon.com/images/I/91DY+GWfzGL._SR960%2C720_.jpg",
    },
    {
      "WOMEN'S APPAREL":
          "https://miro.medium.com/max/1200/1*ZQiuvUy_5xOh1P82CBxE1w.png",
    },
    {
      "SHOES":
          "https://images-na.ssl-images-amazon.com/images/I/41Leu3gBUFL.jpg",
    },
    {
      "KIDS FASHION":
          "https://azyya.com/wp-content/uploads/HM-kids-fashion-clothes-2011-13.jpg",
    },
    
    
  ];

  static const housCategories = [
    {
      "furniture":
          "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1592920567-mid-century-double-pop-up-coffee-table-walnut-white-marble-2-c.jpg",
    },
    {
      "kitchen basics":
          "https://i.pinimg.com/originals/77/c2/dd/77c2ddb8a3c2811781aba63f16cbaa2c.jpg",
    },
    {
      "Tools":
          "https://facom.com.pl/29255/cme16-set-of-76-piece-electronic-tools.jpg",
    },
    
  ];
}
