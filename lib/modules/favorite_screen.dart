import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Trip> favoriteTrips;


  FavoriteScreen(this.favoriteTrips);


  @override
  Widget build(BuildContext context) {

    // هنا بقوله لو القائمه مفيهاش اي favorite اعرض الكلمه دي
    if(favoriteTrips.isEmpty) {
      return Center(child: Text (' ليس لديك اي رحله في قائمه المفضله'));

    }else
    {
      return ListView.builder(
    itemBuilder: (context,index)
    {
    return TripItem(
    id: favoriteTrips[index].id,
    title: favoriteTrips[index].title,
    imageUrl: favoriteTrips[index].imageUrl,
    duration:favoriteTrips[index].duration,
    tripType: favoriteTrips[index].tripType,
    season:  favoriteTrips[index].season,

  //  removeItem: removeTrip,
    );

    },
    itemCount: favoriteTrips.length,
    );
    }


  }
}
