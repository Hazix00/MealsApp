import 'package:flutter/material.dart';

import './screens/filters/filters_screen.dart';
import './screens/main-tabs/main_tabs_screen.dart';
import './screens/meal_details/meal_details_screen.dart';
import './shared/dummy_data.dart';
import './models/meal.dart';
import './screens/category-meals/categories_meals_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegeterian': false,
    'lactose': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  bool _getFilterValue(String key) {
    return _filters.entries.firstWhere((e) => e.key == key).value;
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _getFilterValue('gluten')) return false;
        if (!meal.isVegan && _getFilterValue('vegan')) return false;
        if (!meal.isVegetarian && _getFilterValue('vegeterian')) return false;
        if (!meal.isLactoseFree && _getFilterValue('lactose')) return false;
        return true;
      }).toList();
    });
  }

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
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filterData: _filters, setFilters: _setFilters),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen()
      },
    );
  }
}
