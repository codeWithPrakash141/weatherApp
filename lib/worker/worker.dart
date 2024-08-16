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
 late String icon;


  Future<void> getData() async {
   try {
    String uriString = "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=96e63ca33b4b591a716d39cf4b383481";
    Uri uri = Uri.parse(uriString);
    Response reponse = await get(uri);
    Map data = jsonDecode(reponse.body);

    // getting temp and huminity data
    Map temp_data = data['main'];
    double  tempFehranahiet = temp_data['temp'];
    double tempCelcius = tempFehranahiet-273.15;
    String getTemp = tempCelcius.toString();
    String getHumidity = temp_data["humidity"].toString();

    // getting main and description & main data
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String getMain_des = weather_main_data['main'];
    String getDes = weather_main_data['description'];
    String getIcon = weather_main_data['icon'].toString();

// getting air speed

    Map wind_data = data["wind"];
    double getAirMps = wind_data["speed"];
    double getAirKmp = getAirMps * 3.6;
    String getAir = getAirKmp.toString();

// Assning value

    temp = getTemp;
    humidity = getHumidity;
    airSpeed = getAir.toString();
    description = getDes;
    main = getMain_des;
    icon = getIcon;
   }catch(e){
    temp = "Please check your city";
    humidity = "Please check your city";
    airSpeed = "Please check your city";
    description = "Please check your city";
    main = "Please check your city";
    icon = "Please check your city";
   }
}

}