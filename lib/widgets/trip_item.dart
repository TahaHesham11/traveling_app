import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/modules/trip_details_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
});

String get seasonText{

  switch (season){
    case Season.Winter:
    return 'شتاء';
    break;
    case Season.Spring:
    return 'ربيع';
    break;
    case Season.Autumn:
  return 'خريف';
  break;
    case Season.Summer:
  return 'صيف';
  break;
    default:
      return 'غير معروف';

  }


}

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Activities:
        return 'انشطة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
    }
  }



  void selectTrips (context)
  {
    Navigator.of(context).pushNamed(
        TripDetailsScreen.screenRoute,
    //   then هنا هتشتغل لما اعمل pop  من صفحه  trip-Details-screen الي صفحه  trip item
       arguments: id).then((result) {

         if(result != null)
         {
        //   removeItem(result);
         }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell (
      onTap: ()=>selectTrips(context),


      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 7.0,
        
        margin: EdgeInsets.all(10.0),

        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                  height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  height: 250.0,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      stops: [0.6 , 1]
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today,color:Colors.amber,),
                      SizedBox(width: 6,),
                      Text(
                      '$duration',
                        style:Theme.of(context).textTheme.bodyMedium

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.sunny,color:Colors.amber,),
                      SizedBox(width: 6,),
                      Text(
                        '$seasonText',
                        style:Theme.of(context).textTheme.bodyMedium
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.family_restroom,
                        color:Colors.amber,
                      ),
                      SizedBox(width: 6,),
                      Text(
                        '$tripTypeText',
                          style:Theme.of(context).textTheme.bodyMedium

                      ),
                    ],
                  ),



                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
