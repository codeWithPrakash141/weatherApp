import 'package:flutter/material.dart';
import 'package:portfolio_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum;
  late String air;
  late String des;
  late String main_des;
  void startApp() async {
    Worker instance = Worker(location: "Almora");
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    air = instance.airSpeed;
    des = instance.description;
    main_des = instance.main;
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushNamedAndRemoveUntil(context, "/home",(route) => false,
          arguments: {
            "temp_value": temp,
            "hum_value": hum,
            "air_value": air,
            "des_value": des,
            "main_des_value": main_des
          });
    });

  }

  @override
  void initState() {
    startApp();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
      backgroundColor: Colors.blue[300],
    );
  }
}
