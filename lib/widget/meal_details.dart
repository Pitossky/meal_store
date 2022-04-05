import 'package:flutter/material.dart';
import 'package:online_store/models/meal_model.dart';

import '../screens/meal_details_screen.dart';

class MealDetails extends StatelessWidget {
  final String mealName;
  final String mealImage;
  final int mealDuration;
  final MealComplexity mealComplexity;
  final MealPrice mealAffordability;
  final String mealId;

  MealDetails({
    required this.mealId,
    required this.mealName,
    required this.mealImage,
    required this.mealDuration,
    required this.mealComplexity,
    required this.mealAffordability,
  });

  String get complexityText{
    switch(mealComplexity){
      case MealComplexity.simple:
        return 'Simple';
      case MealComplexity.tasking:
        return 'Tasking';
      case MealComplexity.difficult:
        return 'Difficult';
      default:
        return 'Unknown';
    }
  }

  String get priceText{
    switch(mealAffordability){
      case MealPrice.cheap:
        return 'Cheap';
      case MealPrice.classy:
        return 'Classy';
      case MealPrice.expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void chooseMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
        MealDetailsScreen.routeName,
      arguments: mealId,
    ).then((value) {
      if(value != null){
        //removeMeal(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => chooseMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    mealImage,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      mealName,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule,),
                      const SizedBox(width: 5,),
                      Text(
                          '$mealDuration min',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(width: 10,),
                  Row(
                    children: [
                      const Icon(Icons.work,),
                      const SizedBox(width: 5,),
                      Text(
                        complexityText,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money,),
                      const SizedBox(width: 5,),
                      Text(
                        priceText,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
