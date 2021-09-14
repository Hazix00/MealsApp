import 'package:flutter/material.dart';

import '../../models/meal.dart';

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

  Widget infosItem(BuildContext context,
      {required IconData icon, required String text}) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
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
                      padding: const EdgeInsets.all(10),
                      color: Colors.black.withAlpha(150),
                      child: Text(
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
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infosItem(
                    context,
                    icon: Icons.timer,
                    text: meal.duration.toString(),
                  ),
                  infosItem(
                    context,
                    icon: Icons.work,
                    text: _getEnumStrVal(meal.complexity),
                  ),
                  infosItem(
                    context,
                    icon: Icons.euro,
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
