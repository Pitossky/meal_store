import 'package:flutter/material.dart';
import 'package:online_store/models/meal_model.dart';
import 'package:online_store/screens/favourite_meals.dart';
import 'package:online_store/screens/meals_category_screen.dart';

import '../widget/drawer_widget.dart';

class TabScreen extends StatefulWidget {
  final List<MealModel> favouriteMeals;

  TabScreen({
    required this.favouriteMeals,
  });

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _tabPages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _tabPages = [
      {
        'screen': MealCategoryScreen(),
        'screenTitle': 'Meal Categories',
      },
      {
        'screen': FavouriteMeals(
          favMeal: widget.favouriteMeals,
        ),
        'screenTitle': 'Favourite Meals',
      }
    ];
    super.initState();
  }

  void _chooseTabPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tabPages[_selectedPageIndex]['screenTitle'],
        ),
      ),
      drawer: AppDrawer(),
      body: _tabPages[_selectedPageIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _chooseTabPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).canvasColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
