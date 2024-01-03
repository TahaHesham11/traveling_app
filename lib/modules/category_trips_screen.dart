import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import '../widgets/trip_item.dart';


class CategoryTripsScreen extends StatefulWidget {

final List<Trip> availableTrip;

CategoryTripsScreen(this.availableTrip);

  static const screenRoute = '/category-trips';

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {


  String? categoryTitle;

  late List<Trip> filterTrips;
  @override
  void didChangeDependencies() {

    final routeArgument = ModalRoute.of(context)!
        .settings.arguments as Map<String,String>;

    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];

    filterTrips = widget.availableTrip.where((element) {

      return element.categories.contains(categoryId);

    }).toList();
    super.didChangeDependencies();
  }

void removeTrip(String tripId)
{

  setState(() {
    filterTrips.removeWhere((element) => element.id == tripId
    );
  });
}
@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            categoryTitle!
        ),
      ),


      body: ListView.builder(
          itemBuilder: (context,index)
          {
          return TripItem(
            id: filterTrips[index].id,
              title: filterTrips[index].title,
              imageUrl: filterTrips[index].imageUrl,
              duration:filterTrips[index].duration,
              tripType: filterTrips[index].tripType,
              season:  filterTrips[index].season,

          );

          },
        itemCount: filterTrips.length,
      )
    );
  }
}
