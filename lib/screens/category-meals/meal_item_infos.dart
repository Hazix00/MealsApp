import 'package:flutter/material.dart';

class MealItemInfos extends StatelessWidget {
  const MealItemInfos({
    Key? key,
    required this.context,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final BuildContext context;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
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
}
