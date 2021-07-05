import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';

import 'screens/catagories_meal_screen.dart';
import 'screens/catagories_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tab_screen.dart';
import 'screens/filter_screen.dart';

void main() {
  runApp(const MyApp());
}

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
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;

        _availableMeals = DUMMY_MEALS.where(
          (meal) {
            if (_filters['gluten']! && !meal.isGlutenFree) {
              return false;
            }
            if (_filters['lactose']! && !meal.isLactoseFree) {
              return false;
            }
            if (_filters['vegan']! && !meal.isVegan) {
              return false;
            }
            if (_filters['vegetarian']! && !meal.isVegetarian) {
              return false;
            }
            return true;
          },
        ).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.pinkAccent,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const CatagoryScreen(), //catagory file as homepage
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoryMealScreen(),
      //   );
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CatagoryScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      // body: null,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
