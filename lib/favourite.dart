import 'package:flutter/material.dart';
import 'package:meal_app/mealdata.dart';
import 'package:meal_app/trait.dart';
import 'package:transparent_image/transparent_image.dart';

import 'meal.dart';
import 'mealdetail.dart';

class favTabDetail extends StatefulWidget {
  favTabDetail({super.key, required this.meals});
  final List<Meal> meals;

  @override
  State<favTabDetail> createState() => _favTabDetailState();
}

class _favTabDetailState extends State<favTabDetail> {
  void removeMeal(Meal m) {
    setState(() {
      favouritemeal.remove(m);
    });
  }

  void popup(Meal m, int idx) {
    setState(() {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('removed from favourite!!!'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
            onPressed: () {
              setState(() {
                favouritemeal.insert(idx, m);
              });
            },
            label: 'undo'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: widget.meals.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'no meal here',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Try different category',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.black,
              child: Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Dismissible(background: Container(color: Colors.redAccent),
                          key: ValueKey(widget.meals[index]),
                          onDismissed: (direction) {
                            popup(widget.meals[index], index);
                            removeMeal(widget.meals[index]);
                          },
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return MealDetail(mealinfo: widget.meals[index]);
                                  },
                                ));
                              },
                              child: Stack(
                                children: [
                                  FadeInImage(
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      height: 200,
                                      placeholder:
                                          MemoryImage(kTransparentImage),
                                      image:
                                          NetworkImage(widget.meals[index].imageUrl)),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: Colors.black54,
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.meals[index].title,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                             const SizedBox(
                                                height: 10,
                                              ),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    Trait(
                                                        icon:
                                                            Icons.attach_money,
                                                        type: widget.meals[index]
                                                            .affordability
                                                            .name
                                                            .toUpperCase()),
                                                    const  SizedBox(
                                                      width: 10,
                                                    ),
                                                    Trait(
                                                        icon: Icons.watch_later,
                                                        type: '${widget.meals[index]
                                                                .duration} min'),
                                                    const  SizedBox(
                                                      width: 10,
                                                    ),
                                                    Trait(
                                                        icon: Icons.work,
                                                        type: widget.meals[index]
                                                            .complexity
                                                            .name
                                                            .toUpperCase()),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: widget.meals.length),
              ),
            ),
    );
  }
}

