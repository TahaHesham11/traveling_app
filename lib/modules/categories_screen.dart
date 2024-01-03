import 'package:flutter/material.dart';
import 'package:traveling_app/app.dart';
import 'package:traveling_app/widgets/category_item.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(

        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
            mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        children:
          Categories_data
              .map((CategoryData) => CategoryItem(
            title: CategoryData.title,
            imageUrl: CategoryData.imageUrl,
            id: CategoryData.id,
          ))
              .toList()
    );
  }




}
