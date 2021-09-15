import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../../models/category.dart';
import 'meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categoty-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = (ModalRoute.of(context)?.settings.arguments
        as Map<String, Category>)['category'];
    final meals = availableMeals.where((m) {
      return m.categories.contains(category?.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category!.title),
        backgroundColor: category.color,
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index]);
        },
      ),
    );
  }
}
