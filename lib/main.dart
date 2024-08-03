import 'package:flutter/material.dart';
import 'package:portfolio_app/Activity/home.dart';
import 'package:portfolio_app/Activity/loading.dart';
import 'package:portfolio_app/Activity/location.dart';

void main(){
  runApp(MaterialApp(

    initialRoute: "/loading",
    routes: {
      '/home': (context) => const Home(),
      '/location': (context) => const Location(),
      '/loading': (context) => const Loading(),
    },
  ));
}