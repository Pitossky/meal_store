import 'package:flutter/material.dart';
import 'package:online_store/models/meal_model.dart';

import '../widget/meal_details.dart';

class FavouriteMeals extends StatelessWidget {
  final List<MealModel> favMeal;

  FavouriteMeals({
    required this.favMeal,
});

  @override
  Widget build(BuildContext context) {
    if(favMeal.isEmpty) {
      return Center(
        child: Text('You have no favourites'),
      );
    } else{
      return ListView.builder(
        itemBuilder: (_, index) {
          return MealDetails(
            mealId: favMeal[index].mealId,
            mealName: favMeal[index].mealName,
            mealImage: favMeal[index].mealImage,
            mealDuration: favMeal[index].mealDuration,
            mealComplexity: favMeal[index].mealComplexity,
            mealAffordability: favMeal[index].mealPrice,
          );
        },
        itemCount: favMeal.length,
      );
    }
  }
}
