import 'package:flutter/material.dart';

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
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
