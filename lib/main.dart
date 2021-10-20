import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(
    Map<String, bool> filterData,
  ) =>
      setState(
        () {
          _filters = filterData;
          _availableMeals = DUMMY_MEALS.where((meal) {
            if (_filters['gluten'] as bool && !meal.isGlutenFree) {
              return false;
            }
            if (_filters['lactose'] as bool && !meal.isLactoseFree) {
              return false;
            }
            if (_filters['vegan'] as bool && !meal.isVegan) {
              return false;
            }
            if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
              return false;
            }
            return true;
          }).toList();
        },
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (context) => const TabsScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //       builder: (context) => const CategoriesScreen());
      // },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const CategoriesScreen()),
    );
  }
}
