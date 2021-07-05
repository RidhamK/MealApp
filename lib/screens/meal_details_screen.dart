import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  static const routeName = 'meal-detail';
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(Widget widget) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selecetedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selecetedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 250,
              width: double.infinity,
              child: Image.network(
                selecetedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Text('data'),
            ),
            buildSectionTitle(context, 'Ingridiant'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selecetedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selecetedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor,
                        child: Text(
                          '# ${index + 1}',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      title: Text(selecetedMeal.steps[index]),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
                itemCount: selecetedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(mealId),
      ),
    );
  }
}
