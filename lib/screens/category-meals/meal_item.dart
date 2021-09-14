import 'package:flutter/material.dart';

import '../../models/meal.dart';
import 'meal_item_infos.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  _goToRecipe() {}

  String _getEnumStrVal(Enum enumval) {
    return enumval.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _goToRecipe,
      child: SizedBox(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 25,
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      color: Colors.black.withAlpha(150),
                      child: Text(
                        meal.title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
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
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MealItemInfos(
                    context: context,
                    icon: Icons.timer,
                    text: meal.duration.toString() + ' min',
                  ),
                  MealItemInfos(
                    context: context,
                    icon: Icons.work,
                    text: _getEnumStrVal(meal.complexity),
                  ),
                  MealItemInfos(
                    context: context,
                    icon: Icons.attach_money,
                    text: _getEnumStrVal(meal.affordability),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
