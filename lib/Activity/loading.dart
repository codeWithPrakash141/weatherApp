import 'package:flutter/material.dart';
import 'package:portfolio_app/worker/worker.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void startApp()async{
    Worker instenet = Worker(location: "Almora");
   await instenet.getData();
   instenet.temp;
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
        child: Column(
          children: <Widget>[
            TextButton.icon(onPressed: (){
              Navigator.pushNamed(context,"/home");
            }, icon: Icon(Icons.add_to_home_screen_rounded),label: const Text("Go to home"))
          ],
        ),
      )
    );
  }
}
