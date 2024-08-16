import 'package:flutter/material.dart';
import 'package:portfolio_app/Activity/home.dart';
import 'package:portfolio_app/Activity/loading.dart';
import 'package:portfolio_app/Activity/location.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _MyAppState();
}

class _MyAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/location": (context) => const Location(),
        "/loading" : (context) => const Loading(),
      },
      // themeMode: ThemeMode.light,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Colors.blue,
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   primarySwatch: Colors.purple,
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Colors.purple,
      //   ),
      // ),
    );
  }
}
