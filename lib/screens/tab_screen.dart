import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

import '../screens/catagories_screen.dart';
import '../screens/favoite_screen.dart';

class TabScreen extends StatefulWidget {
  // const TabScreen({Key? key}) : super(key: key);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages = [
    CatagoryScreen(),
    FavoriteScreen(),
  ];
  List<String> _title = ['Categories', 'Favorites'];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_selectedPageIndex]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 25,
        selectedFontSize: 15,
        selectedItemColor: Colors.amberAccent,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'category',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Fav',
          ),
        ],
      ),
    );
  }
}
