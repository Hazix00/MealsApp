import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/meal.dart';
import './meal_item_infos.dart';
import '../meal_details/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailsScreen.routeName,
      arguments: {'meal': meal},
    );
  }

  String _getEnumStrVal(Enum enumval) {
    return enumval.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
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
                    child: CachedNetworkImage(
                      imageUrl: meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
