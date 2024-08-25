import 'package:flutter/material.dart';
import 'package:mausam_app/Activity/home.dart';
import 'package:mausam_app/Activity/loading.dart';
import 'package:mausam_app/Activity/location.dart';

void main() {
  runApp(mausam_app());
}

class mausam_app extends StatefulWidget {
  const mausam_app({super.key});

  @override
  State<mausam_app> createState() => _MyAppState();
}

class _MyAppState extends State<mausam_app> {
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
