import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key,required this.onSelectScreen});
  final void Function(String s) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 200,
              padding: EdgeInsets.fromLTRB(20, 50, 50, 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.8),
                Colors.black54,
              ])),
              child: const Row(children: [
                Icon(Icons.fastfood, size: 50),
                SizedBox(
                  width: 20,
                ),
                Text('Welcome!!',
                    style: TextStyle(fontSize: 25, color: Colors.black)),
              ])),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: const Text('Meals',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    leading: const Icon(
                      Icons.restaurant,
                      size: 35,
                      color: Colors.white,
                    ),
                    onTap: () {
                      onSelectScreen('meal');
  },
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    splashColor: Colors.white,
                    title:const Text('Filters',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    leading: const Icon(
                      Icons.filter_alt_sharp,
                      size: 35,
                      color: Colors.white,
                    ),
                    onTap: () {onSelectScreen('filter');},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
