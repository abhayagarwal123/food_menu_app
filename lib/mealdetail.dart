import 'package:flutter/material.dart';
import 'meal.dart';

class MealDetail extends StatelessWidget {
  MealDetail({super.key, required this.mealinfo});
  Meal mealinfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealinfo.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.network(mealinfo.imageUrl,
                width: double.infinity, height: 250, fit: BoxFit.cover),
            SizedBox(
              height: 15,
            ),
            Text(
              'Ingredient',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            for (final ingredient in mealinfo.ingredients)
              Text(
                ingredient,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in mealinfo.steps)
              Column(
                children: [
                  Text(step,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
