import 'package:flutter/material.dart';
import 'package:meal_app/mealdata.dart';
import 'package:meal_app/mealdetail.dart';
import 'package:meal_app/trait.dart';
import 'meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: meals.isEmpty
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
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onDoubleTap: () {
                              if (!favouritemeal.contains(meals[index])) {
                                favouritemeal.add(meals[index]);
                                ScaffoldMessenger.of(context).clearSnackBars();

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(seconds: 3),
                                        content: Text('Added to favourite!!')));
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(seconds: 3),
                                        content:
                                            Text('Already in favourite!!')));
                              }
                            },
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return MealDetail(mealinfo: meals[index]);
                                },
                              ));
                            },
                            child: Stack(
                              children: [
                                FadeInImage(
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    height: 200,
                                    placeholder: MemoryImage(kTransparentImage),
                                    image: NetworkImage(meals[index].imageUrl)),
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
                                              meals[index].title,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  Trait(
                                                      icon: Icons.attach_money,
                                                      type: meals[index]
                                                          .affordability
                                                          .name
                                                          .toUpperCase()),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Trait(
                                                      icon: Icons.watch_later,
                                                      type: meals[index]
                                                              .duration
                                                              .toString() +
                                                          ' min'),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Trait(
                                                      icon: Icons.work,
                                                      type: meals[index]
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
                      );
                    },
                    itemCount: meals.length),
              ),
            ),
    );
  }
}
