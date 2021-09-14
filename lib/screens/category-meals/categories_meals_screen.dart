import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../shared/dummy_data.dart';
import 'meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categoty-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = (ModalRoute.of(context)?.settings.arguments
        as Map<String, Category>)['category'];
    final meals = DUMMY_MEALS.where((m) {
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
