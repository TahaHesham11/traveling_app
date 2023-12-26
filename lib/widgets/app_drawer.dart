import 'package:flutter/material.dart';
import 'package:traveling_app/componets.dart';
import 'package:traveling_app/modules/filter_screen.dart';
import 'package:traveling_app/modules/taps_screen.dart';

class AppDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon,void Function() onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            'الرحلات',
            Icons.card_travel,
                () {
              
              Navigator.of(context).pushReplacementNamed('/');
              

            },
          ),
          buildListTile(
            'الفلترة',
            Icons.filter_list,
                () {
             Navigator.of(context).pushNamed(FilterScreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }
}