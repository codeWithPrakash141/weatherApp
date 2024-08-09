import 'package:flutter/material.dart';
import 'package:portfolio_app/worker/worker.dart';

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
    Navigator.pushNamedAndRemoveUntil(context, "/home",(route) => false,
        arguments: {
          "temp_value": temp,
          "hum_value": hum,
          "air_value": air,
          "des_value": des,
          "main_des_value": main_des
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
      body: SafeArea(
        child: Text("Loading"),
      ),
    );
  }
}
