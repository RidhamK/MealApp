import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
