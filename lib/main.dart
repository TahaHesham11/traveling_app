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


  // كلهم بيكونو false عشان هما في الاول مبيكونوش شغالين
  Map<String, bool> filters={
    'summer' : false,
    'winter' : false,
    'family' : false,
};

  List<Trip> availableTrip = Trips_data;

  List<Trip> favoriteTrips = [];


  // دي الميثود اللي بتحفظ التغييرات
  void changeFilters(Map<String, bool> filterData)
  {
    setState(() {
      // filterData هي قيمه القيمه الديده بتاعت الفلتر اللي هتيجي من changeFilters
      filters =  filterData;

      availableTrip = Trips_data.where((element) {

  // لو كان الفلتر اشتغل ودوست عليه ولو ده حصل لازم تفحص قيمه ان IsInSummer لا تساةي قيمه true كده مش  هيعرض الرحله
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
        // كده هيعرض كل الرحلات لو كل اتحقق ان هو false
        return true;

      }

      ).toList();
    });

  }


  void manageFavorite(String tripId) {
    // indexwhere بقوله ابحث عن عنصر محدد وهيدينا رقم الرحله من List اللي اسمها favoriteTrips

    // باختصار هذا السطر بيعرفني موجوده في قائمه المفضله او لسه غير موجود
  final existingIndex =  favoriteTrips.indexWhere((element) =>
      element.id == tripId
  );
  //معني كده ان في رحله وكده هحذف
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

  // هنا ببحث ان الرحله موجوده في قائمه المفضله ولا لا
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

  //    home: TabsScreen(),

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

