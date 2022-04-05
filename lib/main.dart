import 'package:flutter/material.dart';
import 'package:online_store/models/meal_model.dart';
import 'package:online_store/models/meals_data.dart';
import 'package:online_store/screens/category_details_screen.dart';
import 'package:online_store/screens/filter_screen.dart';
import 'package:online_store/screens/home_page.dart';
import 'package:online_store/screens/meal_details_screen.dart';
import 'package:online_store/screens/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool?> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<MealModel> _availableMeals = mealList;
  List<MealModel> _favMeals = [];

  void _setFilters(Map<String, bool?> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = mealList.where((element) {
        if (_filters['gluten'] == true && !element.glutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !element.lactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !element.vegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !element.vegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavouriteMeals(String mealId) {
    final favMealIndex = _favMeals.indexWhere(
      (mealElement) => mealElement.mealId == mealId,
    );
    if (favMealIndex >= 0) {
      setState(() {
        _favMeals.removeAt(favMealIndex);
      });
    } else {
      setState(() {
        _favMeals.add(
          mealList.firstWhere(
            (mealElement) => mealElement.mealId == mealId,
          ),
        );
      });
    }
  }

  bool _checkFavourite(String mealId) {
    return _favMeals.any(
      (element) => element.mealId == mealId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.grey,
        splashColor: Colors.white54,
        canvasColor: const Color.fromRGBO(
          255,
          254,
          229,
          1,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
        ).copyWith(
          secondary: Colors.blueGrey,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                //color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: const HomePage(),
      routes: {
        '/': (_) => TabScreen(
              favouriteMeals: _favMeals,
            ),
        CategoryDetails.routeName: (_) => CategoryDetails(
              availableMeals: _availableMeals,
            ),
        MealDetailsScreen.routeName: (_) => MealDetailsScreen(
              manageFavMeals: _manageFavouriteMeals,
              confirmFavMeals: _checkFavourite,
            ),
        FilterScreen.routeName: (_) => FilterScreen(
              filterList: _filters,
              filterFunction: _setFilters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => HomePage());
      },
    );
  }
}
