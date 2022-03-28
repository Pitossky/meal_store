import 'package:flutter/material.dart';
import 'package:online_store/screens/meals_category_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tasty Meals',
        ),
      ),
      body: MealCategoryScreen(),
    );
  }
}
