import 'package:http/http.dart';
import 'dart:convert';
class Worker{
 late String location;
 Worker({required this.location});

 late String temp;
  late String humidity;
 late String airSpeed;
  late String description;
 late  String main;


  Future<void> getData() async {
  String uriString = "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=96e63ca33b4b591a716d39cf4b383481";
  Uri uri = Uri.parse(uriString);
  Response reponse = await get(uri);
  Map data = jsonDecode(reponse.body);

  // getting temp and huminity data
  Map temp_data = data['main'];
  String getTemp = temp_data['temp'].toString();
  String getHumidity = temp_data["humidity"].toString();

  // getting main and description & main data
  List weather_data = data['weather'];
  Map weather_main_data = weather_data[0];
  String getMain_des = weather_main_data['main'];
  String getDes = weather_main_data['description'];

// getting air speed

  Map wind_data = data["wind"];
  double getAir = wind_data["speed"];

// Assning value

  temp = getTemp;
  humidity = getHumidity;
  airSpeed = getAir.toString();
  description = getDes;
  main = getMain_des;
}

}