import 'package:flutter/material.dart';
import 'package:online_store/screens/category_details_screen.dart';
import 'package:online_store/screens/home_page.dart';
import 'package:online_store/screens/meal_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(
          255,
          254,
          229,
          1,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.purple,
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
        '/': (_) => HomePage(),
        CategoryDetails.routeName: (_) => CategoryDetails(),
        MealDetailsScreen.routeName: (_) => MealDetailsScreen(),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (_) => HomePage());
      },
    );
  }
}
