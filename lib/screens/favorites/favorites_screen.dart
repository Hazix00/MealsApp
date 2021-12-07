import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealsapp/cubit/favorites_cubit.dart';
import 'package:mealsapp/screens/category-meals/meal_item.dart';
import 'package:mealsapp/shared/dummy_data.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return state.favoriteMeals.isNotEmpty
            ? ListView.builder(
                itemCount: state.favoriteMeals.length,
                itemBuilder: (ctx, index) {
                  final mealId = state.favoriteMeals[index];
                  final meal = DUMMY_MEALS.firstWhere((m) => m.id == mealId);
                  return MealItem(meal: meal);
                },
              )
            : Center(
                child: Text(
                  'You have no favorites yet - Start adding some!',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              );
      },
    );
  }
}
