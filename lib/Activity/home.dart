import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String tempData = "Loading....";
  String airData = "Loading....";
  String desData = "Loading....";
  String mainDesData = "Loading....";
  String humData = "Loading....";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_){
     _fetchArgument();
   });
  }
void _fetchArgument(){
    var info = ModalRoute.of(context)?.settings.arguments;
    if(info is Map<String,dynamic>){

      setState(() {
        tempData = info["temp_value"];
        airData = info["air_value"];
        desData = info["des_value"];
        mainDesData = info["main_des_value"];
        humData = info["hum_value"];

      });
    }else{
      print("Argument are not a type of Map<String ,dynamic)");
    }
}

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
      ),
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(20),
         child: Column(
           children: <Widget>[
             Text("Temperature : $tempData"),
             Text("Air Speed : $airData"),
             Text("Main description : $mainDesData"),
             Text("Descriiption : $desData"),
             Text("humidity : $humData")
           ],
         ),
       ),
     ),
    );
  }
}
