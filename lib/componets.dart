import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo (context,Widget) =>    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Widget)
);

void navigateAndFinish (context,Widget) =>    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => Widget),
        (route){
      return false;
    }
);