import 'package:flutter/material.dart';
import 'package:online_store/models/meals_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal_details';

  final Function manageFavMeals;
  final Function confirmFavMeals;
  MealDetailsScreen({
    required this.manageFavMeals,
    required this.confirmFavMeals,
  });

  Widget middleText(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget middleContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = mealList.firstWhere(
      (element) => element.mealId == routeArgs,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.mealName}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  selectedMeal.mealImage,
                  fit: BoxFit.cover,
                ),
              ),
              middleText(context, 'INGREDIENTS'),
              middleContainer(
                ListView.builder(
                  itemBuilder: (_, index) => Card(
                    color: Theme.of(context).primaryColorDark,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedMeal.mealIngredients[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.mealIngredients.length,
                ),
              ),
              middleText(context, 'STEPS'),
              middleContainer(
                ListView.builder(
                  itemBuilder: (_, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.cookBook[index]),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                  itemCount: selectedMeal.cookBook.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => manageFavMeals(routeArgs),
        child: Icon(
          confirmFavMeals(routeArgs) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
