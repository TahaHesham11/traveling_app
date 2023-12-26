import 'package:flutter/material.dart';
import 'package:traveling_app/app.dart';

class TripDetailsScreen extends StatelessWidget {

final Function manageFavorite;
final Function isFavorite;


TripDetailsScreen(this.isFavorite,this.manageFavorite);

  static const screenRoute = '/trip-details';

  @override
  Widget build(BuildContext context) {

    // tripId هنا هو id بتاع الرحله الواحده
    final tripId = ModalRoute.of(context)!.settings.arguments as String;

    final selectTrip = Trips_data.firstWhere((element) => element.id == tripId);

    return Scaffold (
      appBar: AppBar(
        title: Text(
          selectTrip.title
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              child: Image.network(
                selectTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            buildSectionItem(context,'الانشطه'),
            buildListView(
              ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index)=> Card(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0
                      ),
                      child: Text(
                        selectTrip.activities[index]
                      ),
                    ),
                  ),
              itemCount: selectTrip.activities.length
              ),
            ),
            buildSectionItem(context,'البرنامج اليومي'),
            buildListView(
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: selectTrip.program.length,
                itemBuilder: (context,index)=>Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(

                          child: Text(
           // عملت index + 1 عشان index هيعد من اول صفر وان معنديش صفر فقولت ليه عد من اول 1
                            ' يوم ${index + 1}'
                          ),
                          radius: 25.0,
                        ),
                        title: Text(
                          selectTrip.program[index]
                        ),
                      ),
                      Container(height: 1,color: Colors.grey[400],)
                    ],
                  ),

              ),
            ),
            SizedBox(height: 150,)

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:()=>
          manageFavorite(tripId),

      child: Icon(

        isFavorite(tripId) ? Icons.star : Icons.star_border_outlined,
        color: Colors.black,

      ),
        backgroundColor: Colors.amber,

      ),

    );
  }

  Widget buildSectionItem(context , String titleText){
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0
      ),
      alignment: Alignment.topRight,
      child: Text(
          titleText,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue
          )
      ),
    );
  }

  Widget buildListView(Widget child)=>  Container(
  decoration: BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.grey),
  borderRadius:BorderRadius.circular(10.0)
  ),
  margin: EdgeInsets.symmetric(horizontal: 15.0),
  height: 240.0,
  child:child
  );
}
