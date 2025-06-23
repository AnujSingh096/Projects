import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return MyHomePage();
      }));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green.shade200, Colors.blue.shade200
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[Image.asset("assets/images/bmmi.png"),
          SizedBox(height: 20,),
          Text("Created by:- Anuj Kumar",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
      ],
      ),

      ),
    );
  }
}