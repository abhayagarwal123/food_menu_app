import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/categories.dart';
import 'package:meal_app/drawer.dart';
import 'package:meal_app/favourite.dart';
import 'package:meal_app/filter.dart';
import 'package:meal_app/mealdata.dart';
import 'package:meal_app/meals.dart';
import 'package:meal_app/favourite.dart';
import 'package:meal_app/provider/meal_provider.dart';

const initialfilter={
  Filter.GlutenFree:false,
  Filter.LactoseFree:false,
  Filter.Vegan:false,
  Filter.Vegetarian:false,
};

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        textTheme: GoogleFonts.loraTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  Map<Filter,bool> selectedfilter=initialfilter;
  void setscreen(String s) async {
    Navigator.pop(context);
    if (s == 'filter') {
      final result =
          await Navigator.push<Map<Filter, bool>>(context, MaterialPageRoute(
        builder: (context) {
          return FilterScreen(currentFilter: selectedfilter,);
        },
      ));
      setState(() {
        selectedfilter=result??initialfilter;
      });


    }
  }

  @override
  Widget build(BuildContext context) {
    final meals=ref.watch(mealsprovider);
    final availablemeal=meals.where((meal) {

      if(selectedfilter[Filter.GlutenFree]!&&!meal.isGlutenFree){
        return false;
      }
      if(selectedfilter[Filter.Vegetarian]!&&!meal.isVegetarian){
        return false;
      }
      if(selectedfilter[Filter.Vegan]!&&!meal.isVegan){
        return false;
      }
      if(selectedfilter[Filter.LactoseFree]!&&!meal.isLactoseFree){
        return false;
      }
      return true;
    },).toList();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: SideDrawer(onSelectScreen: setscreen),
          appBar: AppBar(
            bottom: const TabBar(
                tabs: [Icon(Icons.fastfood), Icon(Icons.favorite)]),
            title: Text(' Meals App',
                style: GoogleFonts.lora(color: Colors.white, fontSize: 25)),
            backgroundColor: Colors.black.withOpacity(0.8),
          ),
          body: Container(
            color: Colors.black,
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Text('Choose Your Meal',
                        style: GoogleFonts.lora(
                            color: Colors.white, fontSize: 25)),
                  Expanded(child: CategoriesScreen(availableMeal: availablemeal,)),
                  ],
                ),
                Column(
                  children: [
                    Text('Favourite Meals',
                        style: GoogleFonts.lora(
                            color: Colors.white, fontSize: 25)),
                    Expanded(child: favTabDetail(meals: favouritemeal)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
