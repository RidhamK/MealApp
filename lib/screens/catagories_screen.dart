import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Meals'),
      // ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.all(25.0),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ))
            .toList(),
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //   maxCrossAxisExtent: 200,
        //   childAspectRatio: 3 / 2,
        //   crossAxisSpacing: 20,
        //   mainAxisExtent: 20,
        // ),
      ),
    );
  }
}
