import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filters/filters_screen.dart';

import '../screens/main-tabs/menu_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  void _navigate(BuildContext context, String route) {
    if (ModalRoute.of(context)!.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          MenuItem(
            icon: Icons.restaurant,
            title: 'Meals',
            onTap: () => _navigate(context, '/'),
          ),
          MenuItem(
            icon: Icons.settings,
            title: 'Filters',
            onTap: () => _navigate(context, FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
