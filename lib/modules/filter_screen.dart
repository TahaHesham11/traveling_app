import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {

  static const screenRoute = '/filters' ;

final Function saveFilters;
final Map<String , bool> currentFilters;


  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _Summer=false;
  var _Winter=false;
  var _Family=false;

  @override
  void initState() {

_Summer = widget.currentFilters['summer']!;
_Winter = widget.currentFilters['winter']!;
_Family = widget.currentFilters['family']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(
          'الفلتره'
        ),
        actions: [
          IconButton(
              onPressed:(){
                final selectedFilters = {
                  'summer' : _Summer,
                  'winter' : _Winter,
                  'family' : _Family,};

              widget.saveFilters(selectedFilters);
        } ,
              icon: Icon(Icons.save)
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(height: 50.0,),
          Expanded(
              child:
          ListView(
            children: [
              buildSwitchListTile(
                  'الرحلات الصفيه فقط',
                  'اظهار الرحلات الصيفيه فقط',
                  _Summer,
                  (newValue)
                  {
                    setState(() {
                      _Summer = newValue;
                    });
                  }
                  ),

              buildSwitchListTile(
                  'العائلات',
                  'اظهار الرحلات التي للعائلات فقط',
                  _Winter,
                      (newValue)
                  {
                    setState(() {
                      _Winter = newValue;
                    });
                  }

              ),

              buildSwitchListTile(
                  'الرحلات الشتويه فقط',
                  'اظهار الرحلات في فصل الشتاء فقط',
                  _Family,
                      (newValue)
                  {
                    setState(() {
                      _Family = newValue;
                    });
                  }

              ),

            ],

          )
          )
        ],
      )
    );
  }


Widget buildSwitchListTile(

    String text,
    String subtitle,
    var current,
    Function updateValue,

    )=>  SwitchListTile(

    title: Text(
        text
    ),
    subtitle: Text(
        subtitle
    ),

    value: current,
    onChanged:(newValue)
    {
      updateValue(newValue);
    }
    );

}
