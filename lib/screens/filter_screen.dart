import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({Key? key}) : super(key: key);
  static const routeName = './filters';

  final Function saveFilter;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.saveFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();

    _glutenFree = widget.currentFilter['gluten']!;

    _lactoseFree = widget.currentFilter['lactose']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;

    // _vegetarian = widget.curruntFilter['vegitarian']!;
    // _vegan = widget.curruntFilter['vegan']!;
    // _lactoseFree = widget.curruntFilter['lactose']!;
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, dynamic updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selectedFilter);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meals',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          _buildSwitchListTile(
            'Gluten-free',
            'Only include gluten-free meals.',
            _glutenFree,
            (newValue) {
              setState(
                () {
                  _glutenFree = newValue;
                },
              );
            },
          ),
          _buildSwitchListTile(
            'Lactose-free',
            'Only include lactose-free meals.',
            _lactoseFree,
            (newValue) {
              setState(
                () {
                  _lactoseFree = newValue;
                },
              );
            },
          ),
          _buildSwitchListTile(
            'Vegetarian',
            'Only include vegetarian meals.',
            _vegetarian,
            (newValue) {
              setState(
                () {
                  _vegetarian = newValue;
                },
              );
            },
          ),
          _buildSwitchListTile(
            'Vegan',
            'Only include vegan meals.',
            _vegan,
            (newValue) {
              setState(
                () {
                  _vegan = newValue;
                },
              );
            },
          )
        ],
      ),
    );
  }
}
