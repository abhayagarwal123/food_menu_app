import 'package:flutter/material.dart';


enum Filter {
  GlutenFree,
  Vegan,
  Vegetarian,
  LactoseFree,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key,required this.currentFilter});
  final Map<Filter,bool>currentFilter;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenfree = false;
  bool vegan = false;
  bool vegetarian = false;
  bool lactosefree = false;

  @override
  void initState() {

    super.initState();
    vegetarian=widget.currentFilter[Filter.Vegetarian]!;
    vegan=widget.currentFilter[Filter.Vegan]!;
    glutenfree=widget.currentFilter[Filter.GlutenFree]!;
   lactosefree=widget.currentFilter[Filter.LactoseFree]!;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        title: const Text(
          'Filters',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Filter.GlutenFree:glutenfree,
            Filter.LactoseFree:lactosefree,
            Filter.Vegan:vegan,
            Filter.Vegetarian:vegetarian,
          });return false;
        },
        child: Container(
          color: Colors.black87,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            SwitchListTile(
                value: glutenfree,
                onChanged: (value) {
                  setState(() {
                    glutenfree = value;
                  });
                },
                title: const Text(
                  'Gluten Free',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'only include gluten free meal',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.blue),
            const SizedBox(
              height: 20,
            ),
            SwitchListTile(
                value: vegan,
                onChanged: (value) {
                  setState(() {
                    vegan = value;
                  });
                },
                title: const Text(
                  'Vegan',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'only include vegan meal',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.blue),
            const SizedBox(
              height: 20,
            ),
            SwitchListTile(
                value: vegetarian,
                onChanged: (value) {
                  setState(() {
                    vegetarian = value;
                  });
                },
                title: const Text(
                  'vegeterian',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'only include vegetarian meal',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.blue),
            const SizedBox(
              height: 20,
            ),
            SwitchListTile(
                value: lactosefree,
                onChanged: (value) {
                  setState(() {
                    lactosefree = value;
                  });
                },
                title: const Text(
                  'Lactose Free',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'only include lactose free meal',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.blue),
          ]),
        ),
      ),
    );
  }
}
