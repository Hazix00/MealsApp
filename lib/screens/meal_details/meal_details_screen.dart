import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealsapp/cubit/favorites_cubit.dart';

import '../../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/meal_details';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget buildListContainer(BuildContext context,
      {required List<Widget> children}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = (ModalRoute.of(context)?.settings.arguments
        as Map<String, Meal>)['meal'];
    int steps = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal!.title),
        actions: [
          IconButton(
            onPressed: () {
              final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
              if (favoritesCubit.state.favoriteMeals.contains(meal.id)) {
                favoritesCubit.removeFromFavorites(meal.id);
              } else {
                favoritesCubit.addToFavorites(meal.id);
              }
            },
            icon: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                final color = state.favoriteMeals.contains(meal.id)
                    ? Colors.yellow
                    : Colors.grey;
                return Icon(
                  Icons.star,
                  color: color,
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: meal.imageUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildListContainer(
              context,
              children: meal.ingredients.map(
                (ingredient) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    margin: const EdgeInsets.all(2),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      ingredient,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            buildSectionTitle(context, 'Steps'),
            buildListContainer(
              context,
              children: meal.steps.map(
                (step) {
                  steps++;
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# $steps'),
                        ),
                        title: Text(
                          step,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
