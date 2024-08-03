import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  print("This is init state");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("This is home page"),
    );
  }
}
