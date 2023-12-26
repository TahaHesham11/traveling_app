import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/modules/categories_screen.dart';
import 'package:traveling_app/modules/favorite_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Trip> favoriteTrips;


  TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {

  int current = 0;


  List<String> titles = [
    'تصنيفات الرحلات',
    'الرحلات المفضله'
  ];


late List<Widget> screen ;

@override
  void initState() {

  screen = [
    CategoriesScreen(),
    FavoriteScreen(widget.favoriteTrips),
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: Text(
        titles[current]
        ),

      ),
      drawer:AppDrawer(),
      body:screen[current],
      
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        currentIndex: current,
        onTap: (int index)
        {
          setState(() {
            current=index;
          });

        },
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'التصنيفات'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'المفضله'),
        ],
      ),
    );
  }
}
