import 'package:flutter/material.dart';
import 'package:traveling_app/componets.dart';
import 'package:traveling_app/modules/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem({required this.id,required this.title,required this.imageUrl});

  void selectCategory (context)
  {
    Navigator.of(context).pushNamed(
      CategoryTripsScreen.screenRoute,
      arguments: {
        'id':id,
        'title': title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap:()
      =>selectCategory(context),

      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Stack (
        children: [
          ClipRRect(

            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge
            ),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),

                borderRadius: BorderRadius.circular(15.0)


            ),
          )
        ],
      ),
    );
  }
}
