import 'package:flutter/material.dart';
import 'package:mausam_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Noida";
  late String temp;
  late String hum;
  late String air;
  late String des;
  late String main_des;
  late String icon;
  void startApp(city) async {
    Worker instance = Worker(location: city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    air = instance.airSpeed;
    des = instance.description;
    main_des = instance.main;
    icon = instance.icon;
if(mounted) {
  Future.delayed(Duration(seconds: 2),(){
if(mounted) {
  Navigator.pushNamedAndRemoveUntil(context, "/home",(route) => false,
          arguments: {
            "temp_value": temp,
            "hum_value": hum,
            "air_value": air,
            "des_value": des,
            "main_des_value": main_des,
            "icon_value" : icon,
            "city_value" : city,
          });
}
    });
}

  }

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments;
    if (argument is Map<String,dynamic>){
      city = argument["search_text"];
    }
    startApp(city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             const SizedBox(height: 170,),
              Image.asset("assets/images/logo.png",height: 240, width: 240,),
              Text("Mausam App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),
              SizedBox(height: 10),
              Text("Made by codeWithPrakash",style: TextStyle(fontSize:18,fontWeight: FontWeight.w500,color: Colors.white),),
            SizedBox(height: 40,),
            SpinKitWave(
            color: Colors.white,
            size: 50.0,
          ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
