import 'package:flutter/material.dart';
import 'package:portfolio_app/Activity/home.dart';
import 'package:portfolio_app/Activity/loading.dart';
import 'package:portfolio_app/Activity/location.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    initialRoute: "/home",
    routes: {
      '/home': (context) => Home(),
      'location': (context) => Location(),
      '/loading': (context) => Loading(),
    },
  ));
}