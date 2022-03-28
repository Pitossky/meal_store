import 'package:flutter/material.dart';
import 'package:online_store/models/meals_data.dart';
import 'package:online_store/widget/meal_details.dart';

class CategoryDetails extends StatelessWidget {
  static const routeName = '/category-details';

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catItemTitle = routeArguments['title'];
    final catItemId = routeArguments['id'];
    final mealDetails = mealList
        .where((meals) => meals.mealCategories.contains(catItemId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          catItemTitle!,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return MealDetails(
            mealId: mealDetails[index].mealId,
            mealName: mealDetails[index].mealName,
            mealImage: mealDetails[index].mealImage,
            mealDuration: mealDetails[index].mealDuration,
            mealComplexity: mealDetails[index].mealComplexity,
            mealAffordability: mealDetails[index].mealPrice,
          );
        },
        itemCount: mealDetails.length,
      ),
    );
  }
}
