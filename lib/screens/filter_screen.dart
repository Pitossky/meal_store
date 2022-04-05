import 'package:flutter/material.dart';
import 'package:online_store/widget/drawer_widget.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function filterFunction;
  final Map<String, bool?> filterList;

  FilterScreen({
    required this.filterList,
    required this.filterFunction,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? _glutenFree = false;
  bool? _lactoseFree = false;
  bool? _vegan = false;
  bool? _vegetarian = false;

  @override
  initState(){
    _glutenFree = widget.filterList['gluten'];
    _lactoseFree = widget.filterList['lactose'];
    _vegetarian = widget.filterList['vegetarian'];
    _vegan = widget.filterList['vegan'];
    super.initState();
  }

  Widget _returnSwitchListTile(
    String titleText,
    String subtitleText,
    bool currentValue,
    Function(bool) valueUpdate,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: valueUpdate,
      title: Text(
        titleText,
      ),
      subtitle: Text(
        subtitleText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food filters'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree,
              };
              widget.filterFunction(selectedFilters);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _returnSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _glutenFree!,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _returnSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals',
                  _lactoseFree!,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _returnSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _vegetarian!,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _returnSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan!,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
