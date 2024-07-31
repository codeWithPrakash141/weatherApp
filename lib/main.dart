import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Portfolio App",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.avif"),
              fit: BoxFit.cover,
            )
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 40, top: 40),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.purple,
                      backgroundImage: AssetImage("assets/images/logo.jpeg"),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: <Widget>[
                        Text("Prakash Mishra",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white)),
                        Text(
                          "Cross Platform Developer",
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.school_rounded,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "UBTER in computer science",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.computer_rounded,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Portfolio App",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Sector 44 Noida",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone_bluetooth_speaker_outlined,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "9310864352",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white,
                        ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.email_rounded,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "prakashmishra5232@gmail.com",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 50),
                  child: Text(
                      "I am a cross-platform developer specializing in iOS and Android development. I create seamless and efficient mobile applications for both platforms, focusing on delivering high-quality user experiences. My expertise includes leveraging frameworks like Flutter to build versatile and responsive apps that run smoothly on multiple devices.", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),),
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 50),
                  child: Text("Developed by Prakash mishra",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w400,color: Colors.white),),
                ),
              ],
            ),
          ),
        ));
  }
}
