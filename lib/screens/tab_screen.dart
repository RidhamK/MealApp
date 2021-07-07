import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/main_drawer.dart';

import '../screens/catagories_screen.dart';
import '../screens/favoite_screen.dart';

class TabScreen extends StatefulWidget {
  // const TabScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // List<String> _title = ['Categories', 'Favorites'];
  // List<Widget> _pages = [
  //   CatagoryScreen(),
  //   FavoriteScreen(widget.favoriteMeals),
  // ];

  List<Map<String, Widget>> _pages = List.empty();
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CatagoryScreen(),
        'title': Text('Categories'),
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': Text('Your Favorite'),
      },
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget _buildText(BuildContext context, String data) {
    return Text(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
