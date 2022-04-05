import 'package:flutter/material.dart';
import 'package:online_store/widget/meal_details.dart';

import '../models/meal_model.dart';

class CategoryDetails extends StatefulWidget {
  static const routeName = '/category-details';

  final List<MealModel> availableMeals;

  CategoryDetails({
    required this.availableMeals,
});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  String? catItemTitle;
  late List<MealModel> mealDetails;
  bool loadedInitData = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
   if (!loadedInitData) {
     final routeArguments =
     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     catItemTitle = routeArguments['title'];
     final catItemId = routeArguments['id'];
     mealDetails = widget.availableMeals
         .where((meals) => meals.mealCategories.contains(catItemId))
         .toList();
     loadedInitData = true;
   }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      mealDetails.removeWhere((element) => element.mealId == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
