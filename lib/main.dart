import 'package:flutter/material.dart';
import 'package:mealsapp/screens/main-tabs/main_tabs_screen.dart';
import 'package:mealsapp/screens/meal_details/meal_details_screen.dart';

import 'screens/category-meals/categories_meals_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 255, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              subtitle2: const TextStyle(
                fontSize: 16,
                fontFamily: 'RobotoCondensed',
                color: Colors.black87,
              ),
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainTabsScreen(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen()
      },
    );
  }
}
