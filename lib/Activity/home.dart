import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:math';

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
    var cityName = ["Noida","Delhi","Almora","London","United State","France"];
    final _random =  new Random();
    var city = cityName [_random.nextInt(cityName.length)];
    return Scaffold(
      body: SafeArea(
    child: Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(vertical: 24,horizontal: 15),
           decoration: BoxDecoration(
             color: Colors.black12,
             borderRadius: BorderRadius.circular(24),
           ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(child: Icon(Icons.search_outlined,color: Colors.blueAccent,),
                    margin: EdgeInsets.fromLTRB(4, 0, 10, 0),),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search $city ",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),

    ),
      ),
    );
  }
}
