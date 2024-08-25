import 'dart:convert';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  String tempData = "N/A";
  String airData = "N/A";
  String desData = "N/A";
  String mainDesData = "N/A";
  String humData = "N/A";
    String iconData = "10d";
    String cityData = "N/A";

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchArgument();
    });
  }

  void _fetchArgument() {
    var info = ModalRoute.of(context)?.settings.arguments;
    if (info is Map<String, dynamic>) {
      setState(() {
        tempData = (info["temp_value"].toString());
        airData = (info["air_value"].toString());
        if(tempData == "N/A"){
          print("worng city");
        }else{
          tempData = (info["temp_value"].toString()).substring(0,4);
          airData = (info["air_value"].toString()).substring(0,3);
        }
        desData = info["des_value"];
        mainDesData = info["main_des_value"];
        humData = info["hum_value"];
        iconData = info["icon_value"];
        cityData = info["city_value"];
      });
    } else {
      print("Argument are not a type of Map<String ,dynamic)");
    }
  }

  @override
  Widget build(BuildContext context) {
    String iconUrl = "https://openweathermap.org/img/wn/$iconData@2x.png";
    var info = ModalRoute.of(context)?.settings.arguments;
    var cityName = [
      "Noida",
      "Delhi",
      "Almora",
      "London",
      "United State",
      "France"
    ];
    final _random = new Random();
    var city = cityName[_random.nextInt(cityName.length)];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue.shade800,
                    Colors.blue.shade300,
                  ]),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll("   ", "") == ""){
                           const  Text("wrong city");
                          }else{
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "search_text" : searchController.text,
                                }

                            );
                          }

                        },
                        child: Container(
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.blueAccent,
                          ),
                          margin: EdgeInsets.fromLTRB(4, 0, 10, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city ",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              iconUrl
                            ),
                            SizedBox(width: 25,),
                            Column(
                              children: <Widget>[
                                Text(
                                  "$desData",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  "In $cityData",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 300,
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          padding: EdgeInsets.all(26),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(WeatherIcons.thermometer),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "$tempData",
                                    style: TextStyle(fontSize: 100),
                                  ),
                                  Text(
                                    "C",
                                    style: TextStyle(fontSize: 40),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(WeatherIcons.wind_deg_315)
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "$airData",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "km/h",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          padding: EdgeInsets.all(26),
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.5)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(WeatherIcons.humidity),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "$humData",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                              Text("Percentage"),
                            ],
                          )),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(
                        "Made by codeWithPrakash",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Data Provided by Openweathermap.org",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
