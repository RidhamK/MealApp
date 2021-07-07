import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/main_drawer.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  // const FavoriteScreen({Key? key}) : super(key: key);
  final List<Meal> _favoriteMeals;
  FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('No Favorite Meal ? Add Some !'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoriteMeals[index].id,
            title: _favoriteMeals[index].title,
            imageUrl: _favoriteMeals[index].imageUrl,
            duration: _favoriteMeals[index].duration,
            complexity: _favoriteMeals[index].complexity,
            affordability: _favoriteMeals[index].affordability,
            // removeItem: () => _removeItem(_favoriteMeals[index].id),
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
