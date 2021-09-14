import 'package:flutter/material.dart';

import '../../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  _goToRecipe() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _goToRecipe,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image.network(meal.imageUrl),
                Text(
                  meal.title,
                  style: Theme.of(context)
                      .copyWith(
                        textTheme: const TextTheme(
                          subtitle1: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      )
                      .textTheme
                      .subtitle1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(meal.title),
              ],
            )
          ],
        ),
      ),
    );
  }
}
