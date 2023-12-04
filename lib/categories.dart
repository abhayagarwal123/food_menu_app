import 'package:flutter/material.dart';
import 'package:meal_app/category.dart';
import 'package:meal_app/mealdata.dart';
import 'package:meal_app/meals.dart';

import 'meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.availableMeal});
  final List<Meal>availableMeal;
  void selectcategory(BuildContext context, Category category) {
    final filteredMeal = availableMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MealsScreen(title: category.title, meals: filteredMeal);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              selectcategory(context, availableCategories[index]);
            },
            splashColor: Colors.red,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  gradient: LinearGradient(colors: [
                    availableCategories[index].color.withOpacity(0.4),
                    availableCategories[index].color.withOpacity(0.9)
                  ])),
              child: Center(
                  child: Text(
                availableCategories[index].title,
                style: const TextStyle(fontSize: 25),
              )),
            ),
          ),
        );
      },
      itemCount: availableCategories.length,
    );
  }
}
