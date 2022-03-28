enum MealComplexity {
  simple,
  tasking,
  difficult,
}

enum MealPrice {
  cheap,
  classy,
  expensive,
}

class MealModel {
  final String mealId;
  final List<String> mealCategories;
  final String mealName;
  final String mealImage;
  final List<String> mealIngredients;
  final List<String> cookBook;
  final int mealDuration;
  final MealComplexity mealComplexity;
  final MealPrice mealPrice;
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegan;
  final bool vegetarian;

  const MealModel({
    required this.mealId,
    required this.mealCategories,
    required this.mealName,
    required this.mealImage,
    required this.mealIngredients,
    required this.cookBook,
    required this.mealDuration,
    required this.mealComplexity,
    required this.mealPrice,
    required this.glutenFree,
    required this.lactoseFree,
    required this.vegan,
    required this.vegetarian,
  });
}
