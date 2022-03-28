import 'package:flutter/material.dart';
import 'package:online_store/widget/category_item.dart';
import 'package:online_store/models/meals_data.dart';

class MealCategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(18),
      children: mealCategoryList.map((mealCat) => CategoryItem(
        categoryId: mealCat.id,
          categoryTitle: mealCat.title,
          catBgColor: mealCat.color,
      )).toList(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
      ),
    );
  }
}
