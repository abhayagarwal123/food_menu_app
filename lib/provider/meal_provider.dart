import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/mealdata.dart';

final mealsprovider = Provider(
  (ref) {
    return dummyMeals;
  },
);
