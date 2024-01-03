import 'package:flutter/material.dart';
import 'package:traveling_app/app.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/modules/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling_app/modules/category_trips_screen.dart';
import 'package:traveling_app/modules/filter_screen.dart';
import 'package:traveling_app/modules/taps_screen.dart';
import 'package:traveling_app/modules/trip_details_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Map<String, bool> filters={
    'summer' : false,
    'winter' : false,
    'family' : false,
};

  List<Trip> availableTrip = Trips_data;

  List<Trip> favoriteTrips = [];


  void changeFilters(Map<String, bool> filterData)
  {
    setState(() {
      filters =  filterData;

      availableTrip = Trips_data.where((element) {

        if(filters['summer'] == true && element.isInSummer != true)
        {
          return false;
        }
        if(filters['winter'] == true && element.isInWinter != true)
        {
          return false;
        }
        if(filters['family'] == true && element.isForFamilies != true)
        {
          return false;
        }
        return true;

      }

      ).toList();
    });

  }


  void manageFavorite(String tripId) {

  final existingIndex =  favoriteTrips.indexWhere((element) =>
      element.id == tripId
  );
  if(existingIndex >= 0)
  {
    setState(() {
      favoriteTrips.removeAt(existingIndex);
    });
  }else
  {
    setState(() {
      favoriteTrips.add(Trips_data.firstWhere((element) =>

        element.id == tripId
      ));
    });
  };
  }

  bool isFavorite(String id)
  {
   return favoriteTrips.any((element) =>

        element.id == id
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar','AE'), // English
      ],
      title: 'Travel App',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),

        )
      ),


      initialRoute: '/',
      routes: {
        '/': (context)=>TabsScreen(favoriteTrips),
        CategoryTripsScreen.screenRoute : (context) => CategoryTripsScreen(availableTrip),
        TripDetailsScreen.screenRoute : (context) => TripDetailsScreen(isFavorite,manageFavorite),
        FilterScreen.screenRoute : (context) => FilterScreen(filters,changeFilters,),
      },
    );
  }
}

