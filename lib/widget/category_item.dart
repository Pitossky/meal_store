import 'package:flutter/material.dart';
import 'package:online_store/screens/category_details_screen.dart';

class CategoryItem extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color catBgColor;

  CategoryItem({
    required this.categoryId,
    required this.categoryTitle,
    required this.catBgColor,
  });

  void displayCatDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryDetails.routeName,
      arguments: {
        'id': categoryId,
        'title': categoryTitle,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => displayCatDetails(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              catBgColor.withOpacity(0.7),
              catBgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
