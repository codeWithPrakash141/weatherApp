import 'package:flutter/material.dart';
import 'package:mausam_app/worker/worker.dart';
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("This is loacation page"),
    );
  }
}

