import 'package:flutter/material.dart';
import '../../shared/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final void Function(Map<String, bool> filterData) setFilters;
  final Map<String, bool> filterData;
  const FiltersScreen(
      {required this.filterData, required this.setFilters, Key? key})
      : super(key: key);
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<Filter> filters = [];

  @override
  void initState() {
    super.initState();
    filters = [
      Filter(
        name: 'gluten',
        title: 'Gluten Free',
        subTitle: 'Only include Gtuten Free meals',
        checked: widget.filterData.entries
            .firstWhere((f) => f.key == 'gluten')
            .value,
      ),
      Filter(
        name: 'vegan',
        title: 'Vegan',
        subTitle: 'Only include Vegan meals',
        checked:
            widget.filterData.entries.firstWhere((f) => f.key == 'vegan').value,
      ),
      Filter(
        name: 'vegeterian',
        title: 'Vegetarian',
        subTitle: 'Only include Vegetarian meals',
        checked: widget.filterData.entries
            .firstWhere((f) => f.key == 'vegeterian')
            .value,
      ),
      Filter(
        name: 'lactose',
        title: 'Lactose Free',
        subTitle: 'Only include Lactose Free meals',
        checked: widget.filterData.entries
            .firstWhere((f) => f.key == 'lactose')
            .value,
      ),
    ];
  }

  List<Widget> _switchBuilder() {
    return filters.map((filter) {
      return SwitchListTile(
        value: filter.checked,
        onChanged: (newValue) {
          setState(() {
            filter.checked = newValue;
          });
          print('===============');
          filters.forEach((element) {
            print('${element.title} \t: ${element.checked}');
          });
          widget.setFilters(
            {for (var filter in filters) filter.name: filter.checked},
          );
        },
        title: Text(filter.title),
        subtitle: Text(filter.subTitle),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ..._switchBuilder(),
        ],
      ),
    );
  }
}

class Filter {
  final String name;
  final String title;
  final String subTitle;
  bool checked;
  Filter({
    required this.checked,
    required this.title,
    required this.subTitle,
    required this.name,
  });
}
